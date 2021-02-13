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

rem create icon on desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\eM Client.lnk" ^
  %PUBLIC%\Desktop

rem remove autostart for em-Client ...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "eM Client" /f

echo ####### %0 #######

