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

rem extend global PATH variable ...
setx PATH "%PATH%;%ProgramFiles%\Far Manager" /M

copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Far Manager 3 x64\Far Manager 3 x64.lnk" ^
  "%PUBLIC%\Desktop\Far Manager.lnk"

echo ####### %0 #######

