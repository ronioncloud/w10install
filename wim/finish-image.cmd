@echo off
set SOURCES=c:\TEMP\W10\sources
set IMAGE=c:\TEMP\IMAGE

if NOT EXIST %SOURCES%\install.wim (
  echo.
  echo [%0] ERROR: %SOURCES%\install.wim NOT found!
  exit /b
)

rd /S /Q %IMAGE%\Windows\Setup\scripts 1>nul 2>nul
mkdir %IMAGE%\Windows\Setup\scripts 1>nul 2>nul

echo copying scripts to %IMAGE%\Windows\Setup\scripts ...
copy /Y SetupComplete.cmd %IMAGE%\Windows\Setup\scripts
if %errorlevel% neq 0 exit /b %errorlevel%

copy /Y StartCustomSetup.cmd %IMAGE%\Windows\Setup\scripts
if %errorlevel% neq 0 exit /b %errorlevel%

echo showing directory contents :
dir %IMAGE%\Windows\Setup\scripts

echo doing cleanup on mountpoint %IMAGE% ...
dism /Image:%IMAGE% /Cleanup-Image /StartComponentCleanup /ResetBase

echo unmounting and committing changes to %SOURCES%\install.wim ...
dism /Unmount-Wim /MountDir:%IMAGE% /Commit

echo directory of %IMAGE% :
dir %IMAGE%

echo exporting %SOURCES%\install.wim to %SOURCES%\install_FINAL.esd ...
dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.wim ^
  /DestinationImageFile:%SOURCES%\install_FINAL.esd ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Recovery ^
  /CheckIntegrity

echo deleting old %SOURCES%\install.wim
del /F %SOURCES%\install.wim

