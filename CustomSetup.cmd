@echo off
set T=c:\TEMP
set TOOLS=c:\tools

echo ####### %0 #######

rem echo DISABLE firewall ...
rem netsh advfirewall set allprofiles state off

echo creating TEMP directory ...
mkdir %T% 1>nul 2>nul

echo killing ssh agent ...
taskkill /F /IM ssh-agent.exe
taskkill /F /IM ssh.exe

echo restart explorer ...
taskkill /F /IM explorer.exe & start explorer.exe

echo deleting %TOOLS% and %SCRIPTS% ...
rd /S /Q %TOOLS%

echo copying folder tools to %TOOLS% ...
robocopy tools %TOOLS% /MIR /256 /NJH /NFL /NDL

rem cd to scripts folder ...
cd scripts

echo unpacking BGInfo ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\BGInfo.zip
del /Q %TOOLS%\BGInfo.zip 1>nul 2>nul

echo unpacking TOTAL commander ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\totalcmd.zip
del /Q %TOOLS%\totalcmd.zip 1>nul 2>nul

echo unpacking notepad++ ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\notepad++.zip
del /Q %TOOLS%\notepad++.zip 1>nul 2>nul

echo unpacking ImapCopy ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\ImapCopy.zip
del /Q %TOOLS%\ImapCopy.zip 1>nul 2>nul

echo installing GIT ...
call install-git.cmd

echo setting GIT_EDITOR variable (all users) ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v GIT_EDITOR ^
  /t REG_EXPAND_SZ ^
  /d "%TOOLS%\vim.exe" ^
  /f

echo setting GIT_SSH variable (all users) ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v GIT_SSH ^
  /t REG_EXPAND_SZ ^
  /d "%TOOLS%\usr\bin\ssh.exe" ^
  /f

rem copy files in deploy folder to tools directory ...
copy /Y deploy\* %TOOLS%

rem create directories for current user ...
mkdir %USERPROFILE%\workspace 1>nul 2>nul
mkdir %USERPROFILE%\.ssh 1>nul 2>nul
copy /Y %TOOLS%\ssh_config %USERPROFILE%\.ssh\config

rem installing startup links ...
call install-logonscript.cmd

rem installing desktop icons ...
call install-desktopicons.cmd

rem installing tweaks ...
call install-tweaks.cmd

rem changing power configuration ...
call install-powertweaks.cmd

rem uninstall OneDrive completely ...
call %SCRIPTS%\uninstall-onedrive.cmd

rem uninstall Edge completely ...
call %SCRIPTS%\uninstall-edge.cmd

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

rem uninstall some Apps (but keep the store) ...
powershell %SCRIPTS%\uninstall-apps.ps1

echo setting PATH variable (all users) ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v PATH ^
  /t REG_EXPAND_SZ ^
  /d "%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin;%TOOLS%\notepad++" ^
  /f

echo cleanup startmenu ...
call %SCRIPTS%\cleanup-startmenu.cmd
powershell -Command %SCRIPTS%\cleanup-tiles.ps1

rem install openshell (fuck you microsoft) ...
call %SCRIPTS%\install-openshell.cmd

rem install Mozilla Firefox (fuck you google) ...
call %SCRIPTS%\install-firefox.cmd

rem install F-Secure Antivirus ...
call %SCRIPTS%\install-antivir.cmd

rem echo ENABLE firewall ...
rem netsh advfirewall set allprofiles state on

rem disable autologon for support user ...
call %SCRIPTS%\disable-autologon.cmd

echo ####### %0 #######
echo READY.
pause

