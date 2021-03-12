@echo off

set CONFIG=config\install-xojo.txt
set EXE=..\software\xojo-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing XOJO processes...
taskkill /F /IM xojo.exe 2>nul

echo installing XOJO ...
start /wait %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo renaming XOJO desktop icon ...
move /Y %PUBLIC%\Desktop\Xojo*.lnk %PUBLIC%\Desktop\XOJO.lnk 2>nul

echo ####### %0 #######
pause

