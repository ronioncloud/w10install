@echo off

IF %1.==. GOTO USAGE
rem removing extension ...
set BASENAME=%~n1
rem adding extension again ...
set SOURCEFILE=%BASENAME%.pb

pbcompiler /EXE %BASENAME%.exe /CONSOLE %SOURCEFILE%
GOTO END

:USAGE
echo "usage: %0 <PureBasic SOURCEFILE>"
  
:END

