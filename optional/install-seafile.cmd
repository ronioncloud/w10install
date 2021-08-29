@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=seafile-setup.msi
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

echo installing SeaFile ...
cd %SOFTWARE%
@echo on
msiexec /i %MSI% /qn
@echo off
cd %OPT%

echo removing SeaFile Desktop icon ...
del /F "%Public%\Desktop\SeaFile.lnk" 2>nul

echo moving SeaFile startmenu shortcut ...
move /Y %STARTMENU%\"Seafile\Start Seafile.lnk" %STARTMENU%\SeaFile.lnk

echo removing SeaFile startmenu folder ...
rd /S /Q %STARTMENU%\"Seafile" 2>nul

echo refreshing desktop (W10 style) ...
ie4uinit.exe -show

echo ####### %0 #######
pause

