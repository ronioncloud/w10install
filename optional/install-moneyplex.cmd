@echo off

set CONFIG=config\install-moneyxplex.txt
set EXE=..\software\moneyplex-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing moneyplex processes...
taskkill /F /IM moneyplex.exe 2>nul

echo installing moneyplex ...
start /wait %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo moving moneyplex startmenu shortcut ...
move /Y %STARTMENU%\"moneyplex\moneyplex.lnk" %STARTMENU%\"MoneyPlex.lnk"

echo removing moneyplex startmenu folder ...
rd /S /Q %STARTMENU%\"moneyplex" 2>nul

echo renaming moneyplex icon on desktop ...
move /Y "%PUBLIC%\Desktop\moneyplex.lnk" "%PUBLIC%\Desktop\MoneyPlex.lnk"

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

