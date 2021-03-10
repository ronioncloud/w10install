@echo off

set CONFIG=config\install-moneyxplex.txt
set EXE=..\software\moneyplex-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing moneyplex processes...
taskkill /F /IM moneyplex.exe 2>nul

echo installing moneyplex ...
start /wait %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######
pause

