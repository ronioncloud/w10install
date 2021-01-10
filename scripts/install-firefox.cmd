@echo off

set CONF=deploy\firefox
set SCRIPTS=..\..\scripts
set SOFTWARE=..\software\firefox

set MSI=Firefox_Setup_83.0b9.msi
set FIREFOXBASE="C:\Program Files\Mozilla Firefox"

set BADGERFILE=%SOFTWARE%\privacy_badger-2020.12.10.xpi
set BADGERTARGET=jid1-MnnxcxisBPnSXQ@jetpack.xpi

set UBLOCKFILE=%SOFTWARE%\ublock_origin-1.32.0.xpi
set UBLOCKTARGET=uBlock0@raymondhill.net.xpi

set PASSWORD1FILE=%SOFTWARE%\1password-1.22.3.xpi
set PASSWORD1TARGET={d634138d-c276-4fc8-924b-40a0ea21d284}.xpi

set BITWARDENFILE=%SOFTWARE%\bitwarden-1.47.1.xpi
set BITWARDENTARGET={446900e4-71c2-419f-a6a7-df9c091e268b}.xpi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /passive
@echo off
cd %SCRIPTS%

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
mkdir %FIREFOXBASE%\distribution\extensions 1>nul 2>nul

echo installing badger(eff) to fight internet bullshit ...
copy /Y %BADGERFILE% %FIREFOXBASE%\distribution\extensions\%BADGERTARGET%

echo installing uBlock to fight even more internet bullshit ...
copy /Y %UBLOCKFILE% %FIREFOXBASE%\distribution\extensions\%UBLOCKTARGET%

echo installing 1Password plugin ...
copy /Y %PASSWORD1FILE% %FIREFOXBASE%\distribution\extensions\%PASSWORD1TARGET%

echo installing Bitwarden plugin ...
copy /Y %BITWARDENFILE% %FIREFOXBASE%\distribution\extensions\%BITWARDENTARGET%

echo ####### %0 #######

