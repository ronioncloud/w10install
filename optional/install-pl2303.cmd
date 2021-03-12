@echo off

set EXE=..\software\pl2303-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Prolific 2303 USB2serial ...
start %EXE%

echo ####### %0 #######
pause
