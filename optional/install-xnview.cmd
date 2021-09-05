@echo off

set CONFIG=config\install-xnview.txt
set EXE=..\software\xnview-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing XnView processes...
taskkill /F /IM xnviewmp.exe 2>nul

echo installing XnView ...
start /wait %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo removing XnView desktop link ...
del /F "%USERPROFILE%\Desktop\XnViewMP.lnk"

echo moving XnView startmenu shortcut ...
move /Y %STARTMENU%\"XnViewMP\XnViewMP.lnk" %STARTMENU%

echo removing XnView startmenu folder ...
rd /S /Q %STARTMENU%\"XnViewMP" 2>nul

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

