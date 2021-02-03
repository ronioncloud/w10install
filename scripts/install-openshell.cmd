@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software

set EXE=OpenShellSetup_4_4_160.exe
set MSI=OpenShellSetup64_4_4_160.msi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
%EXE% extract64
msiexec /i %MSI% ADDLOCAL=StartMenu,ClassicExplorer /passive
@echo off

rem cleanup ...
del /Q %MSI% 1>nul 2>nul
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Open-Shell\Open-Shell Readme.lnk"

cd %SCRIPTS%

echo ####### %0 #######

