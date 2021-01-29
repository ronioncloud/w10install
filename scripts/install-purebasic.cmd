@echo off

set CONFIG=config\install-purebasic.txt
set EXE=..\software\PureBasic_Windows_X64_LTS_5.73.exe

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM PureBasic.exe 2>nul
taskkill /F /IM pbcompiler.exe 2>nul

echo installing PUREBASIC ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

