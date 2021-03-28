@echo off
set SOURCES=c:\TEMP\W10\sources
set BOOT=c:\TEMP\BOOT

if EXIST settings.cmd (
  call settings.cmd
) else (
  set LANG=en-US
)
echo LANG=%LANG%

if NOT EXIST %BOOT%\winsetup.exe (
  echo renaming Windows setup.exe to boot ...
  move /Y %BOOT%\setup.exe %BOOT%\winsetup.exe
)

echo setting language in boot ...
dism /image:%BOOT% /Set-InputLocale:%LANG%
dism /image:%BOOT% /Set-SysLocale:%LANG%

echo replacing setup.exe with our installer utility ...
copy /Y installer.exe %BOOT%\setup.exe

echo copy snapshot64 to boot ...
if EXIST ..\personal\snapshot64.exe (
  copy /Y ..\personal\snapshot64.exe %BOOT%
) else (
  copy /Y ..\software\snapshot64.exe %BOOT%
)

echo copy netuse helper script to boot ...
copy /Y netuse.cmd %BOOT%

echo showing boot contents ...
dir %BOOT%

echo unmounting and committing changes to %SOURCES%\boot.wim ...
dism /Unmount-Wim /MountDir:%BOOT% /Commit

echo directory of %BOOT% :
dir %BOOT%

