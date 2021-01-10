@echo off

IF %1.==. GOTO USAGE

set WORK=c:\TEMP
set SOURCEFILE=%1

pbcompiler /EXE %WORK%\%1.exe /CONSOLE %SOURCEFILE%.pb
GOTO END

:USAGE
echo "usage: %0 <PureBasic SOURCEFILE>"
  
:END

