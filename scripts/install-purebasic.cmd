@echo off

set EXE=..\software\PureBasic_Windows_X64_LTS_5.73.exe

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM PureBasic.exe
taskkill /F /IM pbcompiler.exe

echo installing PUREBASIC ...
%EXE% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

