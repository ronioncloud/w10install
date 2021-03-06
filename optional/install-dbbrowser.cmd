@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=dbbrowser-setup.msi

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

rem copy link to desktop ...
copy /Y "%SCRIPTS%\links\SQLite-DBB.lnk" %PUBLIC%\Desktop

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

