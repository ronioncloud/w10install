@echo off

set TOOLS=c:\tools
set ZIP=..\software\setacl.zip
set T=C:\TEMP

if NOT EXIST %ZIP% (
  echo ERROR: %ZIP% not found!
  exit /b
)

echo ####### %0 #######

echo unpacking SetACL ...
%TOOLS%\7z e -y -aoa -o%T%\setacl %ZIP% 1>nul
move /Y %T%\setacl\*.exe %TOOLS%\setacl.exe
rd /S /Q %T%\setacl
echo.

echo ####### %0 #######
pause

