@echo off

set EDGEROOT="C:\Program Files (x86)\Microsoft\Edge"
set INSTALLER=Application\8*\Installer

echo ####### %0 #######

%EDGEROOT%\%INSTALLER%\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /S /Q %EDGEROOT%

echo ####### %0 #######

