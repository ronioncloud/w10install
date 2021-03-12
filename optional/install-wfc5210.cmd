@echo off

set EXE=..\software\wfc5210-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing printer EPSON WF-C5210 ...
start %EXE%

echo ####### %0 #######
pause
