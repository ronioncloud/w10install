@echo off

set EXE=..\software\inkscape-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing INKSCAPE processes...
taskkill /F /IM inkscape.exe 2>nul

echo installing INKSCAPE ...
start /wait %EXE% /S

echo moving Inkscape startmenu shortcut ...
move /Y %STARTMENU%\"Inkscape\Inkscape.lnk" %STARTMENU%\Inkscape.lnk

echo removing Inkscape startmenu folder ...
rd /S /Q %STARTMENU%\"Inkscape" 2>nul

echo installing Inkscape desktop shortcut ...
copy /Y %STARTMENU%\"Inkscape.lnk" %PUBLIC%\Desktop 2>nul

echo ####### %0 #######
pause

