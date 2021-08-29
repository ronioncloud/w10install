@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=bluejeans-setup.msi

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

echo installing Verizon BlueJeans ...
cd %SOFTWARE%
@echo on
msiexec /i %MSI% INSTALLAUDIODRIVER=1 INSTALLUPDATESVC=0 LAUNCHAFTERINSTALL=0 /q
@echo off
cd %OPT%

echo removing Desktop icon ...
del /F "%USERPROFILE%\Desktop\BlueJeans.lnk" 2>nul

echo ####### %0 #######
pause

