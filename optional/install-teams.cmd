@echo off

set EXE=..\software\teams-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Microsoft Teams ...
start /wait %EXE% -s

echo renaming and moving Teams desktop link ...
move /Y "%USERPROFILE%\Desktop\Microsoft Teams.lnk" "%PUBLIC%\Desktop\Teams.lnk"

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
pause

