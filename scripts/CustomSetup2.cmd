@echo off
rem this script is doing most of the work ...

set T=c:\TEMP
set TOOLS=c:\tools
set SCRIPTS=%TOOLS%\scripts

echo.
echo ####### %0 #######

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

echo setting PATH variable ( for all users) ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /d "%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin;%TOOLS%\notepad++" ^
  /v PATH /t REG_EXPAND_SZ /f
echo.

rem changing power configuration ...
call modify-powersettings.cmd
echo.

rem installing tweaks ...
call install-tweaks.cmd
echo.

echo #######################
echo ### UNINSTALL tasks ###
echo #######################
echo.

rem uninstall ALL Apps (but keep the store) ...
powershell -Command .\uninstall-apps.ps1
echo.

rem uninstall OneDrive completely ...
call uninstall-onedrive.cmd
echo.

rem uninstall Edge completely ...
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

call install-antivir.cmd
echo.

echo #####################
echo ### DISABLE tasks ###
echo #####################
echo.

echo disabling logon screen background ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" ^
  /v DisableLogonBackgroundImage ^
  /t REG_DWORD /d 1 /f
echo.

rem disable autologon for support user ...
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

echo ####### %0 #######
echo READY.
pause
