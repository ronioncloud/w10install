@echo off
set T="c:\TEMP"
set TOOLS="c:\tools"
set SCRIPTS="c:\scripts"

echo ####### SetupComplete.cmd #######

echo killing some processes...
taskkill /F /IM ssh-agent.exe
taskkill /F /IM ssh.exe

echo restart explorer ...
taskkill /F /IM explorer.exe & start explorer.exe

echo deleting %TOOLS% and %SCRIPTS% ...
rd /S /Q %TOOLS%
rd /S /Q %SCRIPTS%

echo creating directories ...
mkdir %T% 1>nul 2>nul
mkdir %TOOLS% 1>nul 2>nul
mkdir %SCRIPTS% 1>nul 2>nul
mkdir %SCRIPTS%\conf 1>nul 2>nul
mkdir %SCRIPTS%\desktop 1>nul 2>nul
mkdir %SCRIPTS%\tweaks 1>nul 2>nul

echo getting TOOLS from webserver ...
ftp -i -s:%WINDIR%\Setup\Scripts\ToolsDownload.ftp
del %WINDIR%\Setup\Scripts\ToolsDownload.ftp

echo ####### SetupComplete.cmd #######

echo STARTING setup script...
call %SCRIPTS%\1st-setup.cmd

