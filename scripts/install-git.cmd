@echo off

set CONFIG=config\install-git.txt
set TOOLS=c:\tools
set EXE=..\software\git-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

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

echo ####### %0 #######

