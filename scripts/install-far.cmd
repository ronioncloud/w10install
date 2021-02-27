@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software

set MSI=far-setup.msi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /x %MSI% /passive
msiexec /i %MSI% INSTALLDIR="%ProgramFiles%\FarManager" /passive
@echo off
cd %SCRIPTS%

echo ####### %0 #######

