@echo off

set EXE=..\software\cyberjack-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing printer ReinerSCT Cyberjack ...
start %EXE%

echo ####### %0 #######
pause
