@echo off

set EXE=..\software\spotify-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Spotify for user %USERNAME% ...
%EXE%

echo ####### %0 #######
timeout /T 3

