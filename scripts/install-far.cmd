@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software

set MSI=Far30b5700.x64.20201112.msi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /quiet 
@echo off
cd %SCRIPTS%

echo ####### %0 #######

