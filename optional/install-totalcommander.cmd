@echo off

set EXE=..\software\totalcommander-setup.exe
set KEY=..\personal\wincmd.key
set TARGET=c:\totalcmd
set STARTMENU=%PROGRAMDATA%\"Microsoft\Windows\Start Menu\Programs"
set STARTMENU_USER=%APPDATA%\"Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing TotalCommander ...
start /wait %EXE% /AHMGDU

rem ... stupid Total Commander is installing its links to user area ? WTF ?
echo renaming and moving TotalCommander desktop link to public desktop ...
move /Y "%USERPROFILE%\Desktop\Total Commander*" "%PUBLIC%\Desktop\TCM.lnk"

echo moving start menu entries to public area ...
move /Y %STARTMENU_USER%\"Total Commander" %STARTMENU% 2>nul

if EXIST %KEY% (
  echo installing license ...
  copy /Y %KEY% %TARGET%
)

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

