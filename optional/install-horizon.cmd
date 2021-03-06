@echo off

set EXE=..\software\horizon-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
)

echo ####### %0 #######

echo installing VMware Horizon client ...
start /wait %EXE% /silent /norestart AUTO_UPDATE_ENABLED=0

echo installing Desktop shortcut ...
move /Y "%PUBLIC%\Desktop\VMware Horizon Client.lnk" "%PUBLIC%\Desktop\Horizon.lnk"

echo ####### %0 #######
pause

