@echo off
rem this script is doing most of the work ...

set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=%TOOLS%\scripts


echo ####### %0 #######

echo creating %T% ...
mkdir %T% 1>nul 2>nul

echo cd to %SCRIPTS% ...
cd /D %SCRIPTS%

echo moving files in deploy folder to %TOOLS% ...
move /Y deploy\* %TOOLS% 1>nul 2>nul
rmdir deploy 1>nul 2>nul

rem #######################
rem ### GLOBAL settings ###
rem #######################

rem echo DISABLE firewall ...
rem netsh advfirewall set allprofiles state off

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

echo setting PATH variable ( for all users) ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v PATH ^
  /t REG_EXPAND_SZ ^
  /d "%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin;%TOOLS%\notepad++" ^
  /f

rem changing power configuration ...
call modify-powersettings.cmd

rem installing tweaks ...
call install-tweaks.cmd

rem #######################
rem ### UNINSTALL tasks ###
rem #######################

echo uninstall ALL Apps (but keep the store) ...
powershell -Command .\uninstall-apps.ps1

rem uninstall OneDrive completely ...
call uninstall-onedrive.cmd

rem uninstall Edge completely ...
call uninstall-edge.cmd

rem #####################
rem ### INSTALL tasks ###
rem #####################

rem install logon script ...
call install-logonscript.cmd

rem install desktop icons ...
call install-desktopicons.cmd

rem install GIT ...
call install-git.cmd

rem install openshell (fuck you microsoft) ...
call install-openshell.cmd

rem install Mozilla Firefox (fuck you google) ...
call install-firefox.cmd

rem install F-Secure Antivirus ...
call install-antivir.cmd

rem #####################
rem ### DISABLE tasks ###
rem #####################

echo disabling logon screen background ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" ^
  /v DisableLogonBackgroundImage ^
  /t REG_DWORD /d 1 /f

rem disable autologon for support user ...
call disable-autologon.cmd

rem #####################
rem ### CLEANUP tasks ###
rem #####################

rem this must be done as late as possible ... stupid os problem
echo cleanup all the tiles ...
powershell -Command .\cleanup-tiles.ps1

rem this one cleans the startmenu and removes dead entries ... stupid os problem #2
call cleanup-startmenu.cmd

rem echo ENABLE firewall ...
rem netsh advfirewall set allprofiles state on

echo ####### %0 #######
echo READY.
pause

