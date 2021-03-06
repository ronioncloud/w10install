@echo off

set EXE=..\software\F-SecureNetworkInstaller-AV_AVTR20F930_.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing F-Secure Anti-Virus ...
start /wait %EXE%

echo removing F-Secure desktop link ...
del /F "%PUBLIC%\Desktop\F-Secure Anti-Virus.lnk" 2>nul

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

