@echo off
set TOOLS=c:\tools
set STATUSFILE=%LOCALAPPDATA%\.user_settings_done
set STARTMENU=%APPDATA%\"Microsoft\Windows\Start Menu\Programs"
set STARTMENU_PUBLIC=%PROGRAMDATA%\"Microsoft\Windows\Start Menu\Programs"

echo ####### %0 #######

echo removing wallpaper ...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d " " /f 1>nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 

echo set desktop colour (RGB) ...
%TOOLS%\setbgcol 3 131 135

echo starting BGInfo ...
%TOOLS%\bginfo\bginfo64.exe %TOOLS%\bginfo\config.bgi /NOLICPROMPT /silent /timer:0

echo.
echo #####
echo ##### USER CONFIG FILES
echo #####
echo.

rem SSH
mkdir %USERPROFILE%\workspace 1>nul 2>nul
mkdir %USERPROFILE%\.ssh 1>nul 2>nul
if NOT EXIST %USERPROFILE%\.ssh\config (
  echo setup for SSH ...
  copy /Y %TOOLS%\scripts\config\ssh-config.txt %USERPROFILE%\.ssh\config
)

rem GIT
if NOT EXIST %USERPROFILE%\.gitconfig (
  if EXIST %TOOLS%\personal\gitconfig (
    echo setup for GIT ...
    copy /Y %TOOLS%\personal\gitconfig %USERPROFILE%\.gitconfig
  )
)

rem VIM
if NOT EXIST %USERPROFILE%\.vimrc (
  echo setup for VIM ...
  copy /Y %TOOLS%\scripts\config\vimrc.txt ^
    %USERPROFILE%\.vimrc
)

rem TOTALCOMMANDER
if NOT EXIST %APPDATA%\GHISLER\WINCMD.ini (
  echo copying ini file for TOTALCOMMANDER ...
  mkdir %APPDATA%\GHISLER 1>nul 2>nul

  rem ini file ...
  if EXIST %TOOLS%\personal\WINCMD.ini (
    copy /Y %TOOLS%\personal\WINCMD.ini %APPDATA%\GHISLER
  ) else (
    copy /Y %TOOLS%\optional\config\WINCMD.ini %APPDATA%\GHISLER
  )

  rem ftp config file ...
  if EXIST %TOOLS%\personal\wcx_ftp.ini (
    copy /Y %TOOLS%\personal\wcx_ftp.ini %APPDATA%\GHISLER
  ) else (
    copy /Y %TOOLS%\optional\config\wcx_ftp.ini %APPDATA%\GHISLER
  )
)

rem WINDOWS TERMINAL
set LOCALSTATE=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
if NOT EXIST %LOCALSTATE%\settings.json (
  echo setup for WINDOWS TERMINAL
  mkdir %LOCALSTATE% 1>nul 2>nul
  copy /Y %TOOLS%\scripts\config\wt-settings.json ^
    %LOCALSTATE%\settings.json
)

if EXIST %STATUSFILE% GOTO END

echo deploying SSH keys ...
copy /Y %TOOLS%\personal\id*.* %USERPROFILE%\.ssh 2>nul

echo.
echo #####
echo ##### USER TWEAKS
echo #####
echo.

echo add "This PC" icon for current user on desktop Windows 10 ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
 /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 1>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
 /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 1>nul

echo add userhome icon on windows 10 desktop for current user ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
 /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0 /f 1>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
 /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0 /f 1>nul

echo refresh desktop (W10 style)
ie4uinit.exe -show

echo enabling fast shutdown ...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" ^
  /v "WaitToKillAppTimeOut" /t REG_DWORD /d 2000 /f 1>nul
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" ^
  /v "HungAppTimeout" /t REG_DWORD /d 2000 /f 1>nul
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" ^
  /v "AutoEndTasks" /t REG_DWORD /d 1 /f 1>nul

echo add seconds to clock ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f 1>nul

echo disable search box on taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" ^
  /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f 1>nul

echo disable multi tasking view button on the taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f 1>nul

echo disable cortana button on the taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "ShowCortanaButton" /t REG_DWORD /d 0 /f 1>nul

echo disable autotray for the taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" ^
  /v "EnableAutoTray" /t REG_DWORD /d 0 /f 1>nul

echo disable notification center ...
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" ^
  /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f 1>nul

echo removing pinned apps from taskbar ...
del /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f

echo loading OpenShell config ...
rem config must be full qualified pathname (OpenShell BUG!)
set CONFIG=%TOOLS%\scripts\config\OpenshellSettings.xml
"%ProgramFiles%\Open-Shell\StartMenu.exe" -xml %CONFIG%

echo restarting explorer ...
taskkill /f /im explorer.exe 2>nul
timeout /T 2
start explorer.exe

rem create statusfile (this block must be executed only once) ...
echo 1 >%STATUSFILE%

:END

echo.
echo #####
echo ##### cleaning ...
echo #####
echo.

rem MORE stupid OS problems ...
rem these actions must to be done over and over again - some zombies keep coming back ...
echo reorg for start menu and desktop ...
echo ####################################
echo.

rem ... stupid OS problem #4
rem why the heck are "System Tools" installed per user ? stupid Microsoft.
echo System Tools ...
move /Y %STARTMENU%\"System Tools\*.*" ^
  %STARTMENU_PUBLIC%\"System Tools" 2>nul

rem remove and rename some stuff ...
move /Y %STARTMENU_PUBLIC%\"System Tools\computer.lnk" ^
  %STARTMENU_PUBLIC%\"System Tools\This PC.lnk" 2>nul
del /F %STARTMENU_PUBLIC%\"System Tools\Command Prompt.lnk" 2>nul

rem ... stupid OS problem #5
rem same here for the accessibility tools. WHY ? stupid Microsoft.
echo Accessibility Tools ...
move /Y %STARTMENU%\"Accessibility\*.*" ^
  %STARTMENU_PUBLIC%\"Accessibility" 2>nul

rem Edge is such a zombie!
echo Microsoft Edge ...
del /F %STARTMENU%\"Microsoft Edge.lnk" 2>nul
del /F %USERPROFILE%\"Desktop\Microsoft Edge.lnk" 2>nul

rem IE too!
echo IE, sigh ...
del /F %STARTMENU%\"Accessories\Internet Explorer.lnk" 2>nul

rem finally remove some useless directories in the users start menu ...
echo Startmenu crap ...
rd /S /Q %STARTMENU%\"Accessories" 2>nul
rd /S /Q %STARTMENU%\"Accessibility" 2>nul
rd /S /Q %STARTMENU%\"Administrative Tools" 2>nul
rd /S /Q %STARTMENU%\"Maintenance" 2>nul
rd /S /Q %STARTMENU%\"System Tools" 2>nul
rd /S /Q %STARTMENU%\"Windows Powershell" 2>nul

echo cleaning users home directory ...
echo #################################
echo.

echo 3D Objects ...
rd /S /Q %USERPROFILE%\"3D Objects" 2>nul

echo Contacts ...
rd /S /Q %USERPROFILE%\Contacts 2>nul

echo Favorites ...
rd /S /Q %USERPROFILE%\Favorites 2>nul

echo Saved Games (folder used by Microsoft only) ...
rd /S /Q %USERPROFILE%\"Saved Games" 2>nul

echo Links ...
rd /S /Q %USERPROFILE%\Links 2>nul

echo Searches ...
rd /S /Q %USERPROFILE%\Searches 2>nul

echo.
echo starting workstation service ...
net start workstation 1>nul 2>nul
net config workstation

echo ####### %0 #######
timeout /T 2

