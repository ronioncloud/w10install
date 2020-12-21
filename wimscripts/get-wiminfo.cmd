echo off
set SOURCES=c:\TEMP\Win10\sources
set FILENAME=%1

IF %1.==. GOTO USAGE

dism /Get-WimInfo /WimFile:%SOURCES%\%FILENAME%
GOTO END

:USAGE
echo "usage: %0 <FILENAME>"

:END

