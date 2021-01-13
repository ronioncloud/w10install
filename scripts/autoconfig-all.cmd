@echo off
rem this script is doing most of the work ...

set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=%TOOLS%\scripts

echo ####### %0 #######
echo.

echo creating %T% ...
mkdir %T% 1>nul 2>nul

echo cd to %SCRIPTS% ...
cd /D %SCRIPTS%

echo moving files in deploy folder to %TOOLS% ...
move /Y deploy\* %TOOLS%
rmdir deploy 1>nul 2>nul

echo.
echo #######################
echo ### GLOBAL settings ###
echo #######################
echo.

rem echo DISABLE firewall ...
rem netsh advfirewall set allprofiles state off
rem echo.

rem allow execution of any powershell script ...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine"
powershell -Command ^
"$T=Get-ExecutionPolicy ; if ($T -eq 'Bypass') { ^
  write-host 'POWERSHELL: Execution Policy was set to BYPASS' ^
} ^
  else { ^
  write-host 'ERROR: CANNOT SET Execution Policy to BYPASS !' ^
}"
echo.

call modify-path.cmd 
echo.

call modify-powersettings.cmd
echo.

call install-tweaks.cmd
echo.

echo #######################
echo ### UNINSTALL tasks ###
echo #######################
echo.

rem uninstall ALL Apps (but keep the store) ...
powershell -Command .\uninstall-apps.ps1
echo.

call uninstall-onedrive.cmd
echo.

call uninstall-edge.cmd
echo.

echo #####################
echo ### INSTALL tasks ###
echo #####################
echo.

call install-logonscript.cmd
echo.

call install-desktopicons.cmd
echo.

call install-git.cmd
echo.

rem fuck you microsoft ...
call install-openshell.cmd
echo.

rem fuck you google ...
call install-firefox.cmd
echo.

call install-emclient.cmd
echo.

call install-softmaker.cmd
echo.

call install-gsync.cmd
echo.

call install-antivir.cmd
echo.

echo #####################
echo ### DISABLE tasks ###
echo #####################
echo.

call disable-logonbackground.cmd 
echo.

call disable-meetnow.cmd
echo.

call disable-autologon.cmd
echo.

echo #####################
echo ### CLEANUP tasks ###
echo #####################
echo.

rem this must be done as late as possible ... stupid os problem
powershell -Command .\cleanup-tiles.ps1
echo.

rem ... stupid os problem #2
call cleanup-startmenu.cmd
echo.

rem echo ENABLE firewall ...
rem netsh advfirewall set allprofiles state on
rem echo.

echo rebooting ...
shutdown -g -t 0
echo.

echo ####### %0 #######
echo READY.
echo.
