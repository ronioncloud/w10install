@echo off
set SCRIPTS=%WINDIR%\Setup\scripts
set LOG=C:\SetupComplete.txt
mkdir %SCRIPTS% 1>nul 2>nul
del /Q %LOG% 1>nul 2>nul

echo ####### %0 #######

copy /Y SetupComplete.cmd %SCRIPTS%
copy /Y ToolsDownload.* %SCRIPTS%

echo ####### %0 #######

call %SCRIPTS%\SetupComplete.cmd

