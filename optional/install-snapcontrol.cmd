@echo off

set TOOLS=c:\tools
set ZIP=..\software\snapcontrol.zip
set T=C:\TEMP

if NOT EXIST %ZIP% (
  echo ERROR: %ZIP% not found!
  exit /b
)

echo ####### %0 #######

%TOOLS%\7z e -y -aoa -o%T%\snapcontrol %ZIP% 1>nul
%T%\snapcontrol\snapcontrol.exe /I
copy /Y %T%\snapcontrol\LICENSE.txt c:\snapshot
copy /Y %T%\snapcontrol\README.md c:\snapshot
rd /S /Q %T%\snapcontrol
echo.

echo ####### %0 #######
pause

