@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set EXE=openshell-setup.exe

if NOT EXIST %SOFTWARE%\%EXE% (
  echo ERROR: %SOFTWARE%\%EXE% not found!
  exit /b
)

rem config must be full qualified pathname (OpenShell BUG!)
set CONFIG=c:\tools\scripts\config\OpenshellSettings.xml 

echo ####### %0 #######

cd %SOFTWARE%
@echo on
%EXE% ADDLOCAL=StartMenu,ClassicExplorer /passive
@echo off
cd %SCRIPTS%

echo removing OpenShell Readme file link ...
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Open-Shell\Open-Shell Readme.lnk" 2>nul

echo loading OpenShell config ...
"%ProgramFiles%\Open-Shell\StartMenu.exe" -xml %CONFIG%

echo ####### %0 #######

