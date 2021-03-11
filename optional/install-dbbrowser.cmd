@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=dbbrowser-setup.msi
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /passive
@echo off
cd %OPT%

echo copying startmenu shortcut ...
copy /Y startmenu\SQLite-DBB.lnk %STARTMENU%

echo ####### %0 #######
pause

