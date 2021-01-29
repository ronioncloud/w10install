@echo off

set CONFIG=config\install-purebasic.txt
set EXE=..\software\PureBasic_Windows_X64_LTS_5.73.exe

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM PureBasic.exe
taskkill /F /IM pbcompiler.exe

echo installing PUREBASIC ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

