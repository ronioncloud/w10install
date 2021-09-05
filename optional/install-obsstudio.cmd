@echo off

set EXE=..\software\obsstudio-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  pause
  exit /b
)

echo ####### %0 #######

echo installing OBS Studio ...
start /wait %EXE% /S

echo moving OBS Studio startmenu shortcut ...
move /Y %STARTMENU%\"OBS Studio\OBS*.lnk" %STARTMENU%

echo removing OBS Studio startmenu folder ...
rd /S /Q %STARTMENU%\"OBS Studio" 2>nul

echo refreshing desktop (W10 style) ...
ie4uinit.exe -show

echo ####### %0 #######
pause
