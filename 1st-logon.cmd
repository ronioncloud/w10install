@echo off
set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=c:\scripts

echo ####### %0 #######

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
mkdir %SCRIPTS%\other 1>nul 2>nul

echo opening firewall for FTP access ...
netsh advfirewall set allprofiles state off

echo getting TOOLS from webserver ...
ftp -i -s:D:\ToolsDownload.ftp

echo ####### %0 #######

echo STARTING setup script...
call %SCRIPTS%\1st-setup.cmd

