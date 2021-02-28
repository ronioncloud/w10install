@echo off

set EXE=..\software\teams-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Microsoft Teams ...
%EXE% -s
timeout /T 10

echo renaming and moving Teams desktop link ...
move /Y "%USERPROFILE%\Desktop\Microsoft Teams.lnk" "%PUBLIC%\Desktop\Teams.lnk"

echo ####### %0 #######
