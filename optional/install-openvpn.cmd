@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=openvpn-setup.msi
set SETTINGS=..\personal\settings.cmd
set openvpn_configfile=configfile
set capicli="%ProgramFiles(x86)%\OpenVPN Technologies\OpenVPN Client\core\capicli.exe"

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

rem ===================
rem CONFIGFILE CHECK
rem ===================

if NOT EXIST %SETTINGS% (
  echo.
  echo WARNING: %SETTINGS% NOT FOUND
  echo.
) else (
  call %SETTINGS%
)


echo ####### %0 #######

echo installing OpenVPN ...
cd %SOFTWARE%
@echo on
msiexec /i %MSI% /q
@echo off
cd %OPT%

echo removing Desktop icon ...
del /F "%PUBLIC%\Desktop\OpenVPN Connect.lnk" 2>nul

echo refreshing desktop (W10 style) ...
ie4uinit.exe -show

rem install configfile from folder personal ...
if EXIST ..\personal\%openvpn_configfile% (
  echo importing OpenVPN configfile ...
  %capicli% -f ..\personal\%openvpn_configfile% ImportProfile
) else (
  echo no configfile found!
)

echo ####### %0 #######
pause
