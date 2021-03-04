@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set MSI=python-setup.msi

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /passive
@echo off
cd %SCRIPTS%

echo ####### %0 #######
