@echo off

set EXE=..\software\totalcommander-setup.exe
set KEY=..\personal\wincmd.key
set TARGET=c:\totalcmd

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing TotalCommander ...
start /wait %EXE% /AHMGDU

echo renaming and moving TotalCommander desktop link ...
move /Y "%USERPROFILE%\Desktop\Total Commander*" "%PUBLIC%\Desktop\TCM.lnk"

if EXIST %KEY% (
  echo installing license ...
  copy /Y %KEY% %TARGET%
)

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

