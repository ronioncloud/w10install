@echo off
set SOURCES=c:\TEMP\W10\sources
set BOOT=c:\TEMP\BOOT

if NOT EXIST %BOOT%\winsetup.exe (
  echo renaming Windows setup.exe to boot ...
  move /Y %BOOT%\setup.exe %BOOT%\winsetup.exe
)

echo replacing setup.exe with our installer utility ...
copy /Y installer.exe %BOOT%\setup.exe

echo showing boot contents ...
dir %BOOT%

echo unmounting and committing changes to %SOURCES%\boot.wim ...
dism /Unmount-Wim /MountDir:%BOOT% /Commit

echo directory of %BOOT% :
dir %BOOT%

