@echo off
set SCRIPTS=%WINDIR%\Setup\scripts
set LOG1=C:\SetupComplete.txt
set LOG2=C:\StartCustomSetup.txt

rem prepare ...
mkdir %SCRIPTS% 1>nul 2>nul
del /F %LOG1% 1>nul 2>nul
del /F %LOG2% 1>nul 2>nul

echo ####### %0 #######

copy /Y SetupComplete.cmd %SCRIPTS%
copy /Y StartCustomSetup.cmd %SCRIPTS%

echo ####### %0 #######

call %SCRIPTS%\SetupComplete.cmd
call %SCRIPTS%\StartCustomSetup.cmd

