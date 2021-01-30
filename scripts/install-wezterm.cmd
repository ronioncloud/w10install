@echo off

set CONFIG=config\install-wezterm.txt
set EXE=..\software\WezTerm-20201101-103216-403d002d-setup.exe

echo ####### %0 #######

echo killing wezterm process ...
taskkill /F /IM wezterm-gui.exe 2>nul

echo installing WEZTERM ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

