@echo off

set CONFIG=config\install-purebasic.txt
set EXE=..\software\purebasic-setup.exe

echo ####### %0 #######

echo killing PureBasic processes...
taskkill /F /IM PureBasic.exe 2>nul
taskkill /F /IM pbcompiler.exe 2>nul

echo installing PUREBASIC ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

rem copy link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PureBasic\PureBasic (x64).lnk" ^
  %PUBLIC%\Desktop

echo ####### %0 #######

