@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set MSI=far-setup.msi

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /x %MSI% /passive
msiexec /i %MSI% INSTALLDIR="%ProgramFiles%\FarManager" /passive
@echo off
cd %SCRIPTS%

echo ####### %0 #######

