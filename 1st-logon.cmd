@echo off
set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=c:\scripts
set FTPSCRIPT=ToolsDownload.ftp

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

echo DISABLE firewall (for FTP access) ...
netsh advfirewall set allprofiles state off

echo getting TOOLS from webserver ...
rem try to call a script...
for %%D in (H G F E D) do (
  if EXIST %%D:\%FTPSCRIPT% (
    echo EXECUTING ftp-script %FTPSCRIPT% on drive %%D ...
    ftp -i -s:%%D:\%FTPSCRIPT%
  ) else (
    echo INFO: %FTPSCRIPT% not found on drive %%D!
  )

)

echo ####### %0 #######

echo STARTING setup script...
call %SCRIPTS%\1st-setup.cmd

