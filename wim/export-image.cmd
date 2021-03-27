@echo off
set SOURCES=c:\TEMP\W10\sources
set WIM=%SOURCES%\install

if NOT EXIST %WIM%.esd (
  echo.
  echo [%0] WARNING: %WIM%.esd NOT found!

  rem search for "install.wim" ...
  if NOT EXIST %WIM%.wim (
    echo [%0] ERROR: %WIM%.wim also NOT found!
    exit /b
  ) else (
    rem rename WIM file ...
    move /Y %WIM%.wim %WIM%-orig.wim
  )
)

echo deleting "old" install.wim ...
del %WIM%.wim 1>nul 2>nul

echo exporting image from %WIM%-orig.wim ...
dism /Export-Image ^
  /SourceImageFile: %WIM%-orig.wim ^
  /DestinationImageFile:%WIM%.wim ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:None ^
  /CheckIntegrity

