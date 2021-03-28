@echo off
set SOURCES=c:\TEMP\W10\sources
set IMAGE=c:\TEMP\IMAGE
set ESD=%SOURCES%\install.esd
set WIM=%SOURCES%\install.wim
set FINAL=%SOURCES%\install_FINAL.esd

if NOT EXIST %WIM% (
  echo.
  echo [%0] ERROR: %WIM% NOT found!
  exit /b
)

rd /S /Q %IMAGE%\Windows\Setup\scripts 1>nul 2>nul
mkdir %IMAGE%\Windows\Setup\scripts 1>nul 2>nul

echo [%0] INFO: copying scripts to %IMAGE%\Windows\Setup\scripts ...
copy /Y SetupComplete.cmd %IMAGE%\Windows\Setup\scripts
copy /Y StartCustomSetup.cmd %IMAGE%\Windows\Setup\scripts
if %ERRORLEVEL% NEQ 0 (
  echo [%0] ERROR: while copying scripts to IMAGE
  exit /b
)

echo [%0] INFO: showing directory contents :
dir %IMAGE%\Windows\Setup\scripts

echo [%0] INFO: doing cleanup on mountpoint %IMAGE% ...
dism /Image:%IMAGE% /Cleanup-Image /StartComponentCleanup /ResetBase

echo [%0] INFO: unmounting and committing changes to %WIM% ...
dism /Unmount-Wim /MountDir:%IMAGE% /Commit

echo [%0] INFO: directory of %IMAGE% :
dir %IMAGE%

echo [%0] INFO: exporting %WIM% to %FINAL% ...
dism /Export-Image ^
  /SourceImageFile:%WIM% ^
  /DestinationImageFile:%FINAL% ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Recovery ^
  /CheckIntegrity

rem delete wim file only in case there is an esd file ...
if EXIST %ESD% (
  echo [%0] INFO: deleting %WIM%
  del /F %SOURCES%\install.wim 2>nul
)

