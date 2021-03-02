@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set MSI=dbbrowser-setup.msi

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

rem copy link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\DB Browser*" ^
  %PUBLIC%\Desktop\DB-Browser.lnk

echo ####### %0 #######
pause

