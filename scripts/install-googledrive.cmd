@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

set MSI=gsync_enterprise64.msi 

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /qn 
@echo off
cd %SCRIPTS%

echo changing startmenu folder ...
move /Y %STARTMENU%\"Backup and Sync from Google\Backup and Sync from Google.lnk" ^
  %STARTMENU%\"Backup and Sync.lnk" 1>nul 2>nul

rem waiting 10 seconds for setup ...
timeout /T 10

tasklist

echo removing google drive startmenu folder ...
@echo on
rd /S /Q %STARTMENU%\"Backup and Sync from Google"
@echo off

echo removing google desktop icons ...
@echo on
del /F /Q %PUBLIC%\Desktop\Google*
@echo off

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######

