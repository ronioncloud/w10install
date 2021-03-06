@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=python2-setup.msi

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

echo ####### %0 #######
