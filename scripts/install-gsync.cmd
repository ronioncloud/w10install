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

echo removing gsync startmenu folder ...
rd /S /Q %STARTMENU%\"Backup and Sync from Google"

echo removing google desktop icons ...
del /F /Q %PUBLIC%\Desktop\Google*

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######

