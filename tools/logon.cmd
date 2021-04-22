@echo off
set TOOLS=c:\tools
set SETTINGS=%TOOLS%\scripts\settings.cmd
set STATUSFILE=%LOCALAPPDATA%\.user_settings_done
set STARTMENU=%APPDATA%\"Microsoft\Windows\Start Menu\Programs"
set STARTMENU_PUBLIC=%PROGRAMDATA%\"Microsoft\Windows\Start Menu\Programs"

echo ####### %0 #######

echo removing wallpaper ...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d " " /f 1>nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 

set bgcol_R=0
set bgcol_G=0
set bgcol_B=0

if EXIST %SETTINGS% (
  echo loading settings ...
  call %SETTINGS%
)

echo setting desktop colour (RGB) ...
%TOOLS%\setbgcol %bgcol_R% %bgcol_G% %bgcol_B%

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

if EXIST %TOOLS%\personal (
  echo.
  echo #####
  echo ##### SSH KEYS
  echo #####
  echo.
  copy /Y %TOOLS%\personal\id*.* %USERPROFILE%\.ssh 2>nul
)

echo.
echo #####
echo ##### USER TWEAKS
echo #####
echo.

echo Adding "This PC" icon for current user on desktop Windows 10 ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
 /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 1>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
 /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 1>nul

echo Refreshing desktop (W10 style)
ie4uinit.exe -show

echo Adding seconds to clock ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f 1>nul

echo Disabling search box on taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" ^
  /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f 1>nul

echo Disabling multi tasking view button on the taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f 1>nul

echo Disabling cortana button on the taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "ShowCortanaButton" /t REG_DWORD /d 0 /f 1>nul

echo Disabling autotray for the taskbar ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" ^
  /v "EnableAutoTray" /t REG_DWORD /d 0 /f 1>nul

echo Disabling notification center ...
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" ^
  /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f 1>nul

echo Loading OpenShell config ...
rem config must be full qualified pathname (OpenShell BUG!)
set CONFIG=%TOOLS%\scripts\config\OpenshellSettings.xml
"%ProgramFiles%"\Open-Shell\StartMenu.exe -xml %CONFIG%

echo Removing user folders from explorer navigation pane ...
for %%K in (
  {0DB7E03F-FC29-4DC6-9020-FF41B59E513A}
  {B4BFCC3A-DB2C-424C-B029-7FE99A87C641}
  {D3162B92-9365-467A-956B-92703ACA08AF}
  {088E3905-0323-4B02-9826-5D99428E115F}
  {3DFDF296-DBEC-4FB4-81D1-6A3438BCF4DE}
  {24AD3AD4-A569-4530-98E1-AB02F9417AA8}
  {F86FA3AB-70D2-4FC7-9C99-FCBF05467F3A}
) do (
  echo %%K
  reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" ^
    /v "%%K" /t REG_DWORD /d 1 /f 1>nul
)

echo Adding home folder to explorer navigation pane ...
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{59031a47-3f72-44a7-89c5-5595fe6b30ee}" ^
  /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 1 /f 1>nul

echo Make explorer show ThisPC on top ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
  /v "LaunchTo" /t REG_DWORD /d 1 /f 1>nul

echo Cleaning up recent files and libraries ...
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\* 2>nul
del /F /Q %APPDATA%\Microsoft\Windows\Recent\* 2>nul
del /F /Q %APPDATA%\Microsoft\Windows\Libraries\* 2>nul

echo Disabling frequent and recent files in explorer ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" ^
  /v "ShowRecent" /t REG_DWORD /d 0 /f 1>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" ^
  /v "ShowFrequent" /t REG_DWORD /d 0 /f 1>nul

echo Restarting explorer ...
taskkill /f /im explorer.exe 2>nul
rem sleep 2 seconds ...
ping 127.0.0.1 -n 2 >nul 2>&1
start explorer.exe

rem create statusfile (this block must be executed only once) ...
echo 1 >%STATUSFILE%

:END

echo.
echo #####
echo ##### CLEANING ...
echo #####
echo.

echo Reorganizing start menu and desktop ...
echo ########################################
echo.

rem ... stupid OS problem #4
rem why the heck are "System Tools" installed per user ? stupid Microsoft.
echo Moving system tools links ...
move /Y %STARTMENU%\"System Tools\*.*" ^
  %STARTMENU_PUBLIC%\"System Tools" 2>nul

rem Removing and renaming some start menu stuff ...
move /Y %STARTMENU_PUBLIC%\"System Tools\computer.lnk" ^
  %STARTMENU_PUBLIC%\"System Tools\This PC.lnk" 2>nul
del /F %STARTMENU_PUBLIC%\"System Tools\Command Prompt.lnk" 2>nul

rem ... stupid OS problem #5
rem same here for the accessibility tools. WHY ? stupid Microsoft.
echo Moving accessibility tools ...
move /Y %STARTMENU%\"Accessibility\*.*" ^
  %STARTMENU_PUBLIC%\"Accessibility" 2>nul

rem ... stupid OS problem #6
rem Edge is such a zombie!
echo Removing microsoft edge links in start menu...
del /F %STARTMENU%\"Microsoft Edge.lnk" 2>nul
del /F %USERPROFILE%\"Desktop\Microsoft Edge.lnk" 2>nul

rem ... stupid OS problem #7
rem Rewards ? Really ? Seriously ?
echo Disabling nag screen in windows settings ...
%TOOLS%\vivetool delconfig 18299130 1

rem IE too!
echo Removing IE links in start menu, sigh ...
del /F %STARTMENU%\"Accessories\Internet Explorer.lnk" 2>nul

rem finally remove some useless directories in the users start menu ...
echo Removing more startmenu crap ...
rd /S /Q %STARTMENU%\"Accessories" 2>nul
rd /S /Q %STARTMENU%\"Accessibility" 2>nul
rd /S /Q %STARTMENU%\"Administrative Tools" 2>nul
rd /S /Q %STARTMENU%\"Maintenance" 2>nul
rd /S /Q %STARTMENU%\"System Tools" 2>nul
rd /S /Q %STARTMENU%\"Windows Powershell" 2>nul
echo.

echo Cleaning users home directory ...
echo ########################################
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
echo Starting workstation service ...
net start workstation 1>nul 2>nul
net config workstation

echo ####### %0 #######

if %ERRORLEVEL% NEQ 0 (
  echo # unknown ERROR! #
  echo ####### %0 #######
  echo.
  pause
)

