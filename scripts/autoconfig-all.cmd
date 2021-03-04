@echo off
rem this script is doing most of the work ...

set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=%TOOLS%\scripts
set LOG=%SCRIPTS%\autoconfig-all.txt

del /F %LOG% 1>nul 2>nul
if not "%1"=="STDOUT_TO_FILE" %0 STDOUT_TO_FILE %* 1>%LOG% 2>&1
shift /1

echo ####### %0 #######
date /t
time /t
echo.

echo creating %T% ...
mkdir %T% 1>nul 2>nul

echo cd to %SCRIPTS% ...
cd /D %SCRIPTS%

echo.
echo #######################
echo ### GLOBAL settings ###
echo #######################
echo.

rem echo DISABLE firewall ...
rem netsh advfirewall set allprofiles state off
rem echo.

rem 7-zip is essential for other scripts ...
call unpack-7zip.cmd
echo.

rem windows update blocker is in the zipfiles ...
call unpack-zipfiles.cmd
echo.

rem put vnc in place ...
call unpack-vnc.cmd
echo.

rem copy some other stuff ...
call copy-exefiles.cmd
echo.

rem this must be done EARLY!
call disable-updates.cmd 
echo.

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

call modify-desktoptheme.cmd
echo.

call modify-taskbar.cmd
echo.

echo #######################
echo ### UNINSTALL tasks ###
echo #######################
echo.

powershell -command .\uninstall-apps.ps1
echo.

call uninstall-onedrive.cmd
echo.

call uninstall-edge.cmd
echo.

echo #####################
echo ### INSTALL tasks ###
echo #####################
echo.

call install-tweaks.cmd
echo.

call install-adk.cmd
echo.

call install-git.cmd
echo.

call install-far.cmd
echo.

powershell -command .\install-windowsterminal.ps1
echo.

call install-go.cmd
echo.

call install-python3.cmd
echo.

rem fuck you microsoft ...
call install-openshell.cmd
echo.

rem fuck you google ...
call install-firefox.cmd
echo.

call install-vlc.cmd
echo.

call install-desktoplinks.cmd
echo.

rem should be done as late as possible ...
call install-logonscript.cmd
echo.

rem add full access rights to all users on public icons!
icacls %PUBLIC%\Desktop\*.lnk /grant Users:F

rem remove read-only flag on tools folder ...
attrib /S /D -R %TOOLS%\*

echo #####################
echo ### DISABLE tasks ###
echo #####################
echo.

call disable-accountpicture.cmd 
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

rem this must be done as late as possible ... stupid os problem #1
powershell -Command .\cleanup-tiles.ps1
echo.

rem ... stupid os problem #2
call cleanup-startmenu.cmd
echo.

rem ... remove ALL the stupid fucking microsoft TELEMETRY BULLSHIT!
rem call uninstall-telemetry.cmd
rem echo.

rem echo ENABLE firewall ...
rem netsh advfirewall set allprofiles state on
rem echo.

echo rebooting ...
shutdown -g -t 0
echo.

date /t
time /t
echo ####### %0 #######
echo READY.
echo.

