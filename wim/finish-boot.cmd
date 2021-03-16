@echo off
set SOURCES=c:\TEMP\W10\sources
set BOOT=c:\TEMP\BOOT

echo renaming Windows setup.exe ...
if NOT EXIST %BOOT%\winsetup.exe (
  move /Y %BOOT%\setup.exe %BOOT%\winsetup.exe
)

echo copy install utility to boot ...
copy /Y installwarning.exe %BOOT%\setup.exe

echo unmounting and committing changes to %SOURCES%\boot.wim ...
dism /Unmount-Wim /MountDir:%BOOT% /Commit

echo directory of %BOOT% :
dir %BOOT%

