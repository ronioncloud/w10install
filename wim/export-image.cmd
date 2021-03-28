@echo off
set SOURCES=c:\TEMP\W10\sources
set ESD=%SOURCES%\install.esd
set WIM=%SOURCES%\install.wim
set W10PRO=%SOURCES%\w10pro.wim
set STATEFILE=%SOURCES%\w10pro.txt

if EXIST %STATEFILE% (

  echo.
  echo [%0] INFO: found %STATEFILE% 
  echo [%0] OK: nothing todo. all work was already done.
  echo READY.
  exit /b

)

if EXIST %ESD% (

  echo.
  echo [%0] INFO: found %ESD% 

  echo [%0] INFO: deleting %WIM% ...
  del %WIM% 2>nul

  echo [%0] INFO: exporting image from %ESD% ...
  dism /Export-Image ^
    /SourceImageFile:%ESD% ^
    /DestinationImageFile:%WIM% ^
    /SourceName:"Windows 10 Pro" ^
    /Compress:Max ^
    /CheckIntegrity

  if %ERRORLEVEL% NEQ 0 (
    echo [%0] ERROR: while extracting %ESD%
    exit /b
  )

  echo.
  echo READY.
  exit /b

)

if EXIST %WIM% (

  rem cleanup ...
  del /F %W10PRO% 1>nul 2>nul

  echo.
  echo [%0] INFO: found %WIM%

  echo [%0] INFO: exporting image from %WIM% ...
  dism /Export-Image ^
    /SourceImageFile:%WIM% ^
    /DestinationImageFile:%W10PRO% ^
    /SourceName:"Windows 10 Pro" ^
    /Compress:Max ^
    /CheckIntegrity

  if %ERRORLEVEL% NEQ 0 (
    echo [%0] ERROR: while extracting %WIM%
    exit /b
  )

  echo [%0] WARNING: removing original %WIM% ...
  attrib -R %WIM% 2>nul
  del /F %WIM% 1>nul 2>nul

  echo [%0] INFO: renaming %W10PRO% ...
  move /Y %W10PRO% %WIM%
  echo all done >%STATEFILE%

  echo.
  echo READY.
  exit /b

)

