@echo off
set LOG=c:\ToolsDownload.txt
set SETUPDIR=c:\Windows\Setup\scripts
set FTPSCRIPT=ToolsDownload.ftp

set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=c:\scripts

del /F %LOG% 1>nul 2>nul
if not "%1"=="STDOUT_TO_FILE" %0 STDOUT_TO_FILE %* 1>%LOG% 2>&1
shift /1

echo ####### %0 #######
date /t
time /t
echo.

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

echo DISABLE firewall (for FTP access) ...
netsh advfirewall set allprofiles state off

echo getting TOOLS from webserver ...
cd /D %SETUPDIR%
if EXIST %FTPSCRIPT% (
  echo EXECUTING ftp script %FTPSCRIPT% in path %SETUPDIR% ...
  ftp -i -s:%FTPSCRIPT%
) else (
  echo INFO: %FTPSCRIPT% not found in path %SETUPDIR% !
)

echo.
date /t
time /t
echo ####### %0 #######

