@echo off

set EDGEROOT="C:\Program Files (x86)\Microsoft\Edge"

echo ####### %0 #######

cd /D C:\
cd %EDGEROOT%\Application\8*\Installer
setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /S /Q %EDGEROOT%

echo ####### %0 #######

