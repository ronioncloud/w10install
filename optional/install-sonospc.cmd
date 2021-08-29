@echo off

set EXE=..\software\sonospc-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing SONOS PC client ...
start /wait %EXE% /L1031 /S /v/qn

rem echo removing F-Secure desktop link ...
rem del /F "%PUBLIC%\Desktop\F-Secure Anti-Virus.lnk" 2>nul

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

