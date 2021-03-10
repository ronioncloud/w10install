@echo off

set EXE=..\software\steam-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing STEAM processes...
taskkill /F /IM steam.exe 2>nul

echo installing STEAM ...
start /wait %EXE% /S

echo ####### %0 #######
pause

