@echo off

set EXE=..\software\citrixworkspace-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  echo GOTO: https://www.citrix.com/de-de/downloads/workspace-app/workspace-app-for-windows-long-term-service-release 
  echo and save the file as "citrixworkspace-setup.exe" in folder "software" !
  pause
  exit /b
)

echo ####### %0 #######

echo installing Citrix Workspace LTS ...
start /wait %EXE% /silent /noreboot

echo disabling autostart for Citrix Workspace ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" ^
  /v "ConnectionCenter" /d 0300000065d2d743d402d701 /t REG_BINARY /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" ^
  /v "Redirector" /d 030000005e06c842d402d701 /t REG_BINARY /f

echo ####### %0 #######
pause

