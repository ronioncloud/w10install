@echo off

set EXE=..\software\motorescue-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"
set STARTMENU_USER=%APPDATA%\"Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  pause
  exit /b
)

echo ####### %0 #######

echo installing Motorola/Lenovo Smart Assistant ...
start /wait %EXE%

echo removing Desktop icon ...
del /F "%USERPROFILE%\Desktop\Rescue and Smart Assistant.lnk" 2>nul

echo moving Smart Assistant startmenu shortcut ...
move /Y %STARTMENU_USER%\"Lenovo\Rescue and Smart Assistant.lnk" %STARTMENU%\"Lenovo Smart Assistant.lnk"

echo removing Smart Assistant startmenu folder ...
rd /S /Q %STARTMENU_USER%\"Lenovo" 2>nul

echo refreshing desktop (W10 style) ...
ie4uinit.exe -show

echo ####### %0 #######
pause

