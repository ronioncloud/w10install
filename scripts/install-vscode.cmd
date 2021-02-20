@echo off

set CONFIG=config\install-vscode.txt
set EXE=..\software\VSCodeSetup-x64-1.53.2.exe

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM Code.exe 2>nul

echo installing Visual Studio CODE ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

