@echo off

set CONFIG=config\install-git.txt
set EXE=..\software\Git-2.29.0-64-bit.exe
set TOOLS=c:\tools

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM ssh-agent.exe 2>nul
taskkill /F /IM ssh.exe 2>nul

echo installing GIT ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

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

rem GIT ...
setx PATH "%PATH%;%TOOLS%\git\bin" /M
setx PATH "%PATH%;%TOOLS%\git\usr\bin" /M

echo ####### %0 #######

