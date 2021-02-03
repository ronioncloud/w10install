@echo off

set EXE=..\software\VirtualBox-6.1.18-142142-Win.exe

echo ####### %0 #######

echo installing VirtualBox ...
%EXE% --silent --ignore-reboot

echo renaming Desktop shortcut ...
move /Y "%PUBLIC%\Desktop\Oracle VM VirtualBox.lnk" ^
  "%PUBLIC%\Desktop\VirtualBox.lnk"

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######

