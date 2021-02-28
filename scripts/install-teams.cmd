@echo off

set EXE=..\software\teams-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Microsoft Teams ...
%EXE% -s
timeout /T 10

echo ####### %0 #######
