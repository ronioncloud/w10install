@echo off

set EXE=..\software\virtualbox-setup.exe
set VBOXMANAGE="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

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

echo ####### %0 #######
pause

