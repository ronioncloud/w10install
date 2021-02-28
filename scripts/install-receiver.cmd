@echo off

set EXE=..\software\citrixreceiver-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Citrix Receiver LTS ...
%EXE% /silent /noreboot

echo disabling autostart for Citrix Receiver ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" ^
  /v "ConnectionCenter" /d 0300000065d2d743d402d701 /t REG_BINARY /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" ^
  /v "Redirector" /d 030000005e06c842d402d701 /t REG_BINARY /f

echo ####### %0 #######
