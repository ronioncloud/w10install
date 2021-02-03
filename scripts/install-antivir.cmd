@echo off

set EXE=..\software\F-SecureNetworkInstaller-AV_AVTR20F930_.exe

echo ####### %0 #######

echo installing F-Secure Anti-Virus ...
%EXE% --silent

echo removing F-Secure desktop link ...
del /F "%PUBLIC%\Desktop\F-Secure Anti-Virus.lnk"

echo ####### %0 #######

