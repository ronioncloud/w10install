@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set EXE=python3-setup.exe

if NOT EXIST %SOFTWARE%\%EXE% (
  echo ERROR: %SOFTWARE%\%EXE% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
%EXE% InstallAllUsers=1 PrependPath=0 /passive
@echo off
cd %SCRIPTS%

echo ####### %0 #######
