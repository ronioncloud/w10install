@echo off
set SCRIPTS=%WINDIR%\Setup\scripts
mkdir %SCRIPTS% 1>nul 2>nul

echo ####### %0 #######

copy /Y SetupComplete*.* %SCRIPTS%

echo ####### %0 #######

call %SCRIPTS%\SetupComplete.cmd
start notepad %SCRIPTS%\SetupComplete.txt

