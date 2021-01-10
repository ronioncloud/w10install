@echo off
set SOURCES=c:\TEMP\W10\sources
set FILENAME=%1

IF %1.==. GOTO USAGE

echo getting infos of %SOURCES%\%FILENAME% ...
dism /Get-WimInfo /WimFile:%SOURCES%\%FILENAME%
GOTO END

:USAGE
echo "usage: %0 <FILENAME>"

:END

