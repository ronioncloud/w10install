@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set EXE=openshell-setup.exe

if NOT EXIST %SOFTWARE%\%EXE% (
  echo ERROR: %SOFTWARE%\%EXE% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
%EXE% ADDLOCAL=StartMenu,ClassicExplorer /passive
@echo off
cd %SCRIPTS%

echo removing OpenShell Readme file link ...
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Open-Shell\Open-Shell Readme.lnk" 2>nul

echo ####### %0 #######

