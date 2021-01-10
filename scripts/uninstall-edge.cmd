@echo off

set EDGEROOT="C:\Program Files (x86)\Microsoft\Edge"
set EDGEUPDATE="C:\Program Files (x86)\Microsoft\EdgeUpdate"
set INSTALLER=Application\8*\Installer

echo ####### %0 #######

%EDGEROOT%\%INSTALLER%\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /S /Q %EDGEROOT% 1>nul 2>nul
rd /S /Q %EDGEUPDATE% 1>nul 2>nul

echo ####### %0 #######

