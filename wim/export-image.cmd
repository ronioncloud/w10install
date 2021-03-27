@echo off
set SOURCES=c:\TEMP\W10\sources
set WIM=%SOURCES%\install.esd

if NOT EXIST %WIM% (
  echo.
  echo [%0] WARNING: %WIM% NOT found!

  rem search for "install.wim" ...
  set WIM=%SOURCES%\install.wim
  if NOT EXIST %WIM% (
    echo [%0] ERROR: %WIM% also NOT found!
    exit /b
  ) else (
    rem rename WIM file ...
    move /Y %WIM% %SOURCES%\install-orig.wim
    set WIM=%SOURCES%\install-orig.wim
  )
)

echo deleting "old" install.wim ...
del %SOURCES%\install.wim 1>nul 2>nul

echo exporting image from %WIM% ...
dism /Export-Image ^
  /SourceImageFile: %WIM% ^
  /DestinationImageFile:%SOURCES%\install.wim ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:None ^
  /CheckIntegrity

