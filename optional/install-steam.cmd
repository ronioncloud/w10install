@echo off

set EXE=..\software\steam-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing STEAM processes...
taskkill /F /IM steam.exe 2>nul

echo installing STEAM ...
start /wait %EXE% /S

echo moving STEAM startmenu shortcut ...
move /Y %STARTMENU%\"Steam\Steam.lnk" %STARTMENU%

echo removing Steam startmenu folder ...
rd /S /Q %STARTMENU%\"Steam" 2>nul

echo ####### %0 #######
pause

