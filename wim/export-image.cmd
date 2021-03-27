@echo off
set SOURCES=c:\TEMP\W10\sources
set ESD=%SOURCES%\install.esd
set WIM=%SOURCES%\install.wim

if NOT EXIST %ESD% (
  echo.
  echo [%0] WARNING: %ESD% NOT found!

  rem search for "install.wim" ...
  if NOT EXIST %WIM% (
    echo [%0] ERROR: %WIM% also NOT found!
    exit /b
  ) else (
    rem rename WIM file ...
    move /Y %WIM% %SOURCES%\install-orig.wim
  )
)

echo deleting "old" install.wim ...
del %WIM% 1>nul 2>nul

echo exporting image from %SOURCES%\install-orig.wim ...
dism /Export-Image ^
  /SourceImageFile: %SOURCES%\install-orig.wim ^
  /DestinationImageFile:%WIM% ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:None ^
  /CheckIntegrity

