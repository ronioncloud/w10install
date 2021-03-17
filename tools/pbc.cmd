@echo off

IF %1.==. GOTO USAGE

rem remove extension ...
set BASENAME=%~n1

rem removing extension and get full path ...
set FULLBASE=%~dpn1

rem adding extension to fullbase again ...
set SOURCEFILE=%FULLBASE%.pb

pbcompiler /EXE %BASENAME%.exe /CONSOLE %SOURCEFILE%
GOTO END

:USAGE
echo "usage: %0 <PureBasic SOURCEFILE>"
  
:END

