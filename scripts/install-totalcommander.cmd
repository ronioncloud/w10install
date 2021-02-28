@echo off

set EXE=..\software\totalcommander-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing TotalCommander ...
%EXE% /AHMGDU

rem this runs in the background - we have to wait 10 seconds for it to complete ...
timeout /T 10

echo renaming TotalCommander desktop link ...
move /Y "%USERPROFILE%\Desktop\Total Commander*" "%PUBLIC%\Desktop\Total Commander.lnk"

echo ####### %0 #######
