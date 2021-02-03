@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software

rem must be full qualified pathname (OpenShell BUG!)
set CONFIG=c:\tools\scripts\config\OpenshellSettings.xml 

set EXE=OpenShellSetup_4_4_160.exe
set MSI=OpenShellSetup64_4_4_160.msi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
%EXE% extract64
msiexec /i %MSI% ADDLOCAL=StartMenu,ClassicExplorer /passive
@echo off

rem cleanup ...
del /F %MSI%
cd %SCRIPTS%

echo removing OpenShell Readme file link ...
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Open-Shell\Open-Shell Readme.lnk"

echo loading OpenShell config ...
"%ProgramFiles%\Open-Shell\StartMenu.exe" -xml %CONFIG%

echo ####### %0 #######

