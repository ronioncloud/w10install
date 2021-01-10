@echo off
set SOURCES=c:\TEMP\W10\sources
set MNT=c:\TEMP\WIM

rd /S /Q %MNT%\Windows\Setup\scripts 1>nul 2>nul
mkdir %MNT%\Windows\Setup\scripts 1>nul 2>nul

echo copying SetupComplete script to mountpoint %MNT% ...
copy /Y SetupComplete.cmd %MNT%\Windows\Setup\scripts
if %errorlevel% neq 0 exit /b %errorlevel%

echo copying script for custom setup to mountpoint %MNT% ...
copy /Y StartCustomSetup.cmd %MNT%\Windows\Setup\scripts
if %errorlevel% neq 0 exit /b %errorlevel%

echo showing directory contents :
dir %MNT%\Windows\Setup\scripts

echo doing cleanup on mountpoint %MNT% ...
dism /Image:%MNT% /Cleanup-Image /StartComponentCleanup /ResetBase

echo unmounting and committing changes to %SOURCES%\install.wim ...
dism /Unmount-Wim /MountDir:%MNT% /Commit

echo directory of %MNT% :
dir %MNT%

echo exporting %SOURCES%\install.wim to %SOURCES%\install_FINAL.esd ...
dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.wim ^
  /DestinationImageFile:%SOURCES%\install_FINAL.esd ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Recovery ^
  /CheckIntegrity

echo deleting old %SOURCES%\install.wim
del /F %SOURCES%\install.wim

