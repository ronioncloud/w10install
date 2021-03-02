@echo off

set CONFIG=config\install-vscode.txt
set EXE=..\software\vscode-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM Code.exe 2>nul

echo installing Visual Studio CODE ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######
pause

