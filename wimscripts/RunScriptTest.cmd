@echo off
set SCRIPTS=%WINDIR%\Setup\scripts
set LOG=C:\SetupComplete.txt
mkdir %SCRIPTS% 1>nul 2>nul
del /Q %LOG%

echo ####### %0 #######

copy /Y SetupComplete.cmd %SCRIPTS%

echo ####### %0 #######

call %SCRIPTS%\SetupComplete.cmd
start notepad %LOG%

