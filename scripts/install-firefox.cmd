@echo off

set CONFIG=config\firefox
set SCRIPTS=..\scripts
set SOFTWARE=..\software
set EXE=firefox-setup.exe

if NOT EXIST %SOFTWARE%\%EXE% (
  echo ERROR: %SOFTWARE%\%EXE% not found!
  exit /b
)

set FIREFOXBASE="%ProgramFiles%\Mozilla Firefox"

set BADGERFILE=%SOFTWARE%\privacybadger-addon.xpi
set BADGERTARGET=jid1-MnnxcxisBPnSXQ@jetpack.xpi

set UBLOCKFILE=%SOFTWARE%\ublockorigin-addon.xpi
set UBLOCKTARGET=uBlock0@raymondhill.net.xpi

set PASSWORD1FILE=%SOFTWARE%\1password-addon.xpi
set PASSWORD1TARGET={d634138d-c276-4fc8-924b-40a0ea21d284}.xpi

set BITWARDENFILE=%SOFTWARE%\bitwarden-addon.xpi
set BITWARDENTARGET={446900e4-71c2-419f-a6a7-df9c091e268b}.xpi

echo ####### %0 #######

cd %SOFTWARE%
@echo on
firefox-setup.exe /S /MaintenanceService=false /TaskbarShortcut=false /RegisterDefaultAgent=false
@echo off
echo sleep 5 seconds ...
ping 127.0.0.1 -n 5 > NUL 2>&1
cd %SCRIPTS%

rem copy config ...
copy /Y %CONFIG%\local-settings.js %FIREFOXBASE%\defaults\pref
copy /Y %CONFIG%\mozilla.cfg %FIREFOXBASE%

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

