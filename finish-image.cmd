@echo off
set SOURCES=c:\TEMP\Win10\sources
set MNT=c:\TEMP\WIM

rd /S /Q %MNT%\Windows\Setup\scripts 1>nul 2>nul
mkdir %MNT%\Windows\Setup\scripts 1>nul 2>nul

echo copy SetupComplete script ...
copy /Y SetupComplete.cmd %MNT%\Windows\Setup\scripts
if %errorlevel% neq 0 exit /b %errorlevel%

echo copy ftp scripts ...
copy /Y ToolsDownload.* %MNT%\Windows\Setup\scripts
if %errorlevel% neq 0 exit /b %errorlevel%

dir %MNT%\Windows\Setup\scripts

dism /Image:%MNT% /Cleanup-Image /StartComponentCleanup /ResetBase
dism /Unmount-Wim /MountDir:%MNT% /Commit

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.wim ^
  /DestinationImageFile:%SOURCES%\install_FINAL.esd ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Recovery ^
  /CheckIntegrity

del /Q %SOURCES%\install.wim
dir %MNT%

