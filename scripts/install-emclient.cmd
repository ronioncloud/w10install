@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software

set MSI=emclient-v8.1.1054.msi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /quiet 
@echo off
cd %SCRIPTS%

copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\eM Client.lnk" ^
  %PUBLIC%\Desktop

echo ####### %0 #######

