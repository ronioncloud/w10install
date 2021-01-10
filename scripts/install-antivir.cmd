@echo off
set T=c:\TEMP
mkdir %T% 1>nul 2>nul
cd /D %T%

set EXE=F-SecureNetworkInstaller-AV_AVTR20F930_.exe
set URL="ftp://w10install:9054c6cf-c54c@exabyte-systems.com/software/%EXE%"

echo ####### %0 #######

echo download ...
curl --ftp-pasv %URL% --output %EXE%

echo installing F-Secure Antivirus ...
%EXE% --silent

rem cleanup ...
del /Q %EXE% 1>nul 2>nul

echo ####### %0 #######

