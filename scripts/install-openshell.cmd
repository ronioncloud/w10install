@echo off
set T=c:\TEMP
mkdir %T% 1>nul 2>nul
cd /D %T%

set EXE=OpenShellSetup_4_4_160.exe
set MSI=OpenShellSetup64_4_4_160.msi
set URL="ftp://w10install:9054c6cf-c54c@exabyte-systems.com/software/%EXE%"

echo ####### %0 #######

echo download ...
curl --ftp-pasv %URL% --output %EXE%

@echo on
%EXE% extract64
msiexec /i %MSI% ADDLOCAL=StartMenu,ClassicExplorer /passive
@echo off

rem cleanup ...
del /Q %MSI% 1>nul 2>nul
del /Q %EXE% 1>nul 2>nul

echo ####### %0 #######

