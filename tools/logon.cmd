@echo off
set TOOLS=c:\tools

echo ####### %0 #######

echo removing wallpaper ...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d " " /f 1>nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 

echo set desktop colour ...
%TOOLS%\setbgcol

echo starting BGInfo ...
%TOOLS%\bginfo\bginfo64.exe %TOOLS%\bginfo\config.bgi /NOLICPROMPT /silent /timer:0

rem #####
rem ##### USER CONFIG FILES
rem #####

echo creating some directories and copy files for current user ...

rem SSH
mkdir %USERPROFILE%\workspace 1>nul 2>nul
mkdir %USERPROFILE%\.ssh 1>nul 2>nul
if NOT EXIST %USERPROFILE%\.ssh\config (
  copy /Y %TOOLS%\scripts\config\ssh-config.txt %USERPROFILE%\.ssh\config
)

rem VIM
if NOT EXIST %USERPROFILE%\.vimrc (
  copy /Y %TOOLS%\scripts\config\vimrc.txt ^
    %USERPROFILE%\.vimrc
)

rem TOTALCOMMANDER
if NOT EXIST %APPDATA%\GHISLER\WINCMD.ini (
  mkdir %APPDATA%\GHISLER 1>nul 2>nul
  copy /Y %TOOLS%\scripts\config\WINCMD.ini %APPDATA%\GHISLER
  copy /Y %TOOLS%\scripts\config\wcx_ftp.ini %APPDATA%\GHISLER
)

rem WINDOWS TERMINAL
set LOCALSTATE=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
if NOT EXIST %LOCALSTATE%\settings.json (
  mkdir %LOCALSTATE% 1>nul 2>nul
  copy /Y %TOOLS%\scripts\config\wt-settings.json ^
    %LOCALSTATE%\settings.json
)

rem #####
rem ##### USER TWEAKS
rem #####

if EXIST %LOCALAPPDATA%\.user_settings_done GOTO END

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

echo restarting explorer ...
taskkill /f /im explorer.exe 1>nul 2>nul
start explorer.exe

rem try to delete some useless files ...
del /F "$APPDATA%\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk" 1>nul 2>nul
del /F "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" 1>nul 2>nul 
del /F "%USERPROFILE%\Desktop\Microsoft Edge.lnk" 1>nul 2>nul

echo 1 >%LOCALAPPDATA%\user_settings_done

rem #####
rem #####
rem #####

echo starting workstation service ...
net start workstation 1>nul 2>nul
net config workstation

:END
echo ####### %0 #######
