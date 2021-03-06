@echo off

set CONFIG=config\install-xnview.txt
set EXE=..\software\xnview-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing XnView processes...
taskkill /F /IM xnviewmp.exe 2>nul

echo installing XnView ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo renaming and moving XnView desktop link ...
move /Y "%USERPROFILE%\Desktop\XnViewMP.lnk" "%PUBLIC%\Desktop"

echo ####### %0 #######
pause

