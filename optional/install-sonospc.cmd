@echo off

set EXE=..\software\sonospc-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing SONOS PC client ...
start /wait %EXE% /L1031 /S /v/qn

echo moving SONOS startmenu shortcut ...
move /Y %STARTMENU%\"Sonos\Sonos.lnk" %STARTMENU%\Sonos.lnk

echo removing SONOS startmenu folder ...
rd /S /Q %STARTMENU%\"Sonos" 2>nul

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

