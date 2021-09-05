@echo off

set EXE=..\software\virtualbox-setup.exe
set VBOXMANAGE="%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe"
set STARTMENU=%PROGRAMDATA%\"Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing VirtualBox ...
%EXE% --silent --ignore-reboot

echo renaming Desktop shortcut ...
move /Y "%PUBLIC%\Desktop\Oracle VM VirtualBox.lnk" ^
  "%PUBLIC%\Desktop\VirtualBox.lnk"

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo disabling VirtualBox update search ...
%VBOXMANAGE% setextradata global GUI/UpdateDate never

echo moving VirtualBox startmenu shortcut ...
move /Y %STARTMENU%\"Oracle VM VirtualBox\Oracle VM VirtualBox.lnk" %STARTMENU%

echo removing VirtualBox startmenu folder ...
rd /S /Q %STARTMENU%\"Oracle VM VirtualBox" 2>nul

echo ####### %0 #######
pause

