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

echo removing autostart for em-Client ...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" ^
  /v "eM Client" /f

taskkill /F /IM SystemSettings.exe 2>nul

echo copying link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\eM Client.lnk" ^
  %PUBLIC%\Desktop

echo refreshing desktop ...
ie4uinit.exe -show

echo disabling automatic updates via W10 firewall ...
netsh advfirewall firewall delete rule name="block_emclient_updates" 2>nul
netsh advfirewall firewall add rule name="block_emclient_updates" ^
  dir=out action=block protocol=tcp localip=any remoteip=168.62.48.183 ^
  remoteport=80,443 program="%ProgramFiles(x86)%\eM Client\MailClient.exe"

echo ####### %0 #######
pause

