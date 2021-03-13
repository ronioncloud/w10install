@echo off

set EXE=..\software\cyberjack-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Reiner SCT Cyberjack ...
start /wait %EXE%

echo changing cyberjack startmenu folder ...
move /Y %STARTMENU%\"Reiner SCT cyberjack\cyberjack*.*" %STARTMENU%\CyberJack.lnk 2>nul

echo removing cyberjack startmenu folder ...
rd /S /Q %STARTMENU%\"Reiner SCT cyberjack" 2>nul

echo removing cyberjack desktop icon ...
del /F /Q %PUBLIC%\Desktop\cyberjack*.* 2>nul

echo ####### %0 #######
pause
