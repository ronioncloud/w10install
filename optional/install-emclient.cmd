@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=emclient-setup.msi

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /quiet
@echo off
cd %OPT%

rem copy link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\eM Client.lnk" ^
  %PUBLIC%\Desktop

rem remove autostart for em-Client ...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" ^
  /v "eM Client" /f

taskkill /F /IM SystemSettings.exe 2>nul

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

