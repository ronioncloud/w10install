@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=gsync-setup.msi
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /qn 
@echo off
cd %OPT%

echo changing startmenu folder ...
move /Y %STARTMENU%\"Backup and Sync from Google\Backup and Sync from Google.lnk" ^
  %STARTMENU%\"Backup and Sync.lnk"

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
pause

