@echo off

set EXE=..\software\F-SecureNetworkInstaller-AV_AVTR20F930_.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing F-Secure Anti-Virus ...
%EXE% --silent

echo removing F-Secure desktop link ...
del /F "%PUBLIC%\Desktop\F-Secure Anti-Virus.lnk" 2>nul

echo ####### %0 #######
pause

