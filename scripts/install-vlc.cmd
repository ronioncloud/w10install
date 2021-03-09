@echo off

set EXE=..\software\vlc-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing VLC player ...
%EXE% /L=1033 /S

echo removing Desktop link ...
del /F "%PUBLIC%\Desktop\VLC media player.lnk" 2>nul

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######

