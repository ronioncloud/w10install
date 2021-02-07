@echo off

set EDGEROOT="C:\Program Files (x86)\Microsoft\Edge"
set EDGEUPDATE="C:\Program Files (x86)\Microsoft\EdgeUpdate"
set INSTALLER=Application\8*\Installer

echo ####### %0 #######

%EDGEROOT%\%INSTALLER%\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

echo cleanup ...
tasklist
taskkill /F /IM "*edge*"

@echo on
rd /S /Q %EDGEROOT%
rd /S /Q %EDGEUPDATE%
del /F "%PUBLIC%\Desktop\Microsoft Edge.lnk"
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
del /F "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
del /F "%USERPROFILE%\Desktop\Microsoft Edge.lnk"
rd /S /Q "%PROGRAMDATA%\Microsoft\EdgeUpdate"
@echo off

echo block edge updates ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate" ^
  /v "DoNotUpdateToEdgeWithChromium" /d 1 /t REG_DWORD /f

echo ####### %0 #######

