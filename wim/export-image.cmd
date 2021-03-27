@echo off
set SOURCES=c:\TEMP\W10\sources
set ESD=%SOURCES%\install.esd
set WIM=%SOURCES%\install.wim
set W10PRO=%SOURCES%\w10pro.wim
set STATEFILE=%SOURCES%\w10pro.txt

if EXIST %ESD% (

  echo.
  echo INFO: found %ESD% 

  echo deleting "old" install.wim ...
  del %WIM% 1>nul 2>nul

  echo exporting image from %ESD% ...
  dism /Export-Image ^
    /SourceImageFile:%ESD% ^
    /DestinationImageFile:%WIM% ^
    /SourceName:"Windows 10 Pro" ^
    /Compress:Max ^
    /CheckIntegrity

  echo.
  echo READY.
  exit /b

)


if EXIST %WIM% (

  rem cleanup ...
  del /F %W10PRO% 1>nul 2>nul

  echo.
  echo INFO: found %WIM%

  echo exporting image from %WIM% ...
  dism /Export-Image ^
    /SourceImageFile:%WIM% ^
    /DestinationImageFile:%W10PRO% ^
    /SourceName:"Windows 10 Pro" ^
    /Compress:Max ^
    /CheckIntegrity

  attrib -R %WIM%
  move /Y %W10PRO% %WIM%
  echo all done >%STATEFILE%

  echo.
  echo READY.
  exit /b

)

if EXIST %STATEFILE% (

  echo.
  echo INFO: found %STATEFILE% 
  echo nothing todo. all work was already done.
  echo READY.
  exit /b

)

set ERRORLEVEL=9009

