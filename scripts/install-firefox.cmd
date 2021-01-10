@echo off
set T=c:\TEMP
mkdir %T% 1>nul 2>nul
cd /D %T%

set CONF=c:\scripts\conf
set URL="ftp://w10install:9054c6cf-c54c@exabyte-systems.com/software/firefox"

set MSI=Firefox_Setup_83.0b9.msi
set FIREFOXBASE="C:\Program Files\Mozilla Firefox"

set BADGERFILE=privacy_badger-2020.12.10.xpi
set BADGERTARGET=jid1-MnnxcxisBPnSXQ@jetpack.xpi

set UBLOCKFILE=ublock_origin-1.32.0.xpi
set UBLOCKTARGET=uBlock0@raymondhill.net.xpi

set PASSWORD1FILE=1password-1.22.3.xpi
set PASSWORD1TARGET={d634138d-c276-4fc8-924b-40a0ea21d284}.xpi

set BITWARDENFILE=bitwarden-1.47.1.xpi
set BITWARDENTARGET={446900e4-71c2-419f-a6a7-df9c091e268b}.xpi

echo ####### %0 #######

echo download ...
curl --ftp-pasv %URL%/%MSI% --output %MSI%

@echo on
msiexec /i %MSI% /passive
@echo off

rem copy config ...
copy /Y %CONF%\local-settings.js %FIREFOXBASE%\defaults\pref
copy /Y %CONF%\mozilla.cfg %FIREFOXBASE%

echo disabling FireFox updates (all users) ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" ^
  /v DisableAppUpdate ^
  /t REG_DWORD ^
  /d 1 ^
  /f

echo enabling FireFox Bookmarks-bar for all users ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" ^
  /v DisplayBookmarksToolbar ^
  /t REG_DWORD ^
  /d 1 ^
  /f

echo creating extensions directory ...
mkdir %FIREFOXBASE%\distribution\extensions

echo download ...
curl --ftp-pasv %URL%/%BADGERFILE% --output %BADGERFILE%

echo installing badger(eff) to fight internet bullshit ...
move /Y %BADGERFILE% %FIREFOXBASE%\distribution\extensions\%BADGERTARGET%

echo download ...
curl --ftp-pasv %URL%/%UBLOCKFILE% --output %UBLOCKFILE%

echo installing uBlock to fight even more internet bullshit ...
move /Y %UBLOCKFILE% %FIREFOXBASE%\distribution\extensions\%UBLOCKTARGET%

echo download ...
curl --ftp-pasv %URL%/%PASSWORD1FILE% --output %PASSWORD1FILE%

echo installing 1Password plugin ...
move /Y %PASSWORD1FILE% %FIREFOXBASE%\distribution\extensions\%PASSWORD1TARGET%

echo download ...
curl --ftp-pasv %URL%/%BITWARDENFILE% --output %BITWARDENFILE%

echo installing Bitwarden plugin ...
move /Y %BITWARDENFILE% %FIREFOXBASE%\distribution\extensions\%BITWARDENTARGET%

rem cleanup ...
del /Q %MSI% 1>nul 2>nul

echo ####### %0 #######

