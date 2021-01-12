@echo off

set EDGEROOT="C:\Program Files (x86)\Microsoft\Edge"
set EDGEUPDATE="C:\Program Files (x86)\Microsoft\EdgeUpdate"
set INSTALLER=Application\8*\Installer

echo ####### %0 #######

%EDGEROOT%\%INSTALLER%\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

echo cleanup ...
rd /S /Q %EDGEROOT% 1>nul 2>nul
rem rd /S /Q %EDGEUPDATE% 1>nul 2>nul
del /F "%PUBLIC%\Desktop\Microsoft Edge.lnk" 1>nul 2>nul
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" 1>nul 2>nul

echo block edge updates ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate" ^
  /v "DoNotUpdateToEdgeWithChromium" /d 1 /t REG_DWORD /f

echo ####### %0 #######

