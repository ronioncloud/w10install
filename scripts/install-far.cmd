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
msiexec /i %MSI% INSTALLDIR="%ProgramFiles%\FarManager" /passive
@echo off
cd %SCRIPTS%

rem copy link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Far Manager 3 x64\Far*" ^
  %PUBLIC%\Desktop

echo renaming Far Manager desktop link ...
move /Y "%PUBLIC%\Desktop\Far Manager 3 x64.lnk" "%PUBLIC%\Desktop\Far Manager.lnk"

echo ####### %0 #######
