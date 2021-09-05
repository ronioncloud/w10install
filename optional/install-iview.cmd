@echo off

set EXE=..\software\iview-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  echo GOTO: https://www.irfanview.com/64bit.htm
  echo and save the file as "iview-setup.exe" in folder "software" !
  pause
  exit /b
)

echo ####### %0 #######

echo installing IrfanView ...
start /wait %EXE% /silent /desktop=1 /folder="c:\iview" /group=1 /allusers=1 /assoc=1

echo removing IrfanView startmenu folder ...
rd /S /Q %STARTMENU%\"IrfanView" 2>nul

echo moving IrfanView desktop links to Startmenu ...
move /Y "%PUBLIC%\Desktop\IrfanView*.lnk" %STARTMENU%

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

