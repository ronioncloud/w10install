@echo off

set EXE=..\software\cyberjack-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

if EXIST "%ProgramFiles(x86)%\REINER SCT\cyberJack\cJCC.exe" (
  echo ERROR: Reiner SCT Cyberjack already installed!
  exit /b
)

echo ####### %0 #######

echo installing Reiner SCT Cyberjack ...
start /wait %EXE%

echo moving CyberJack startmenu shortcut ...
move /Y %STARTMENU%\"Reiner SCT cyberjack\cyberjack Device Manager*.*" %STARTMENU%\CyberJack.lnk

echo removing CyberJack startmenu folder ...
rd /S /Q %STARTMENU%\"Reiner SCT cyberjack" 2>nul

echo removing CyberJack desktop shortcut ...
del /F /Q %PUBLIC%\Desktop\cyberjack*.* 2>nul

echo ####### %0 #######
pause

