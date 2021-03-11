
@echo off

set TOOLS=c:\tools
set CONFIG=config\hakchi2_config.ini
set ZIP=..\software\hakchi2.zip
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %ZIP% (
  echo ERROR: %ZIP% not found!
  exit /b
)

echo ####### %0 #######

echo killing hakchi2 processes...
taskkill /F /IM hakchi.exe 2>nul

echo unpacking Hakchi2 ...
%TOOLS%\7z x -y -aoa -o"%ProgramFiles(x86)%" %ZIP%

echo copying config ...
mkdir "%ProgramFiles(x86)%\hakchi2\config" 2>nul
copy /Y %CONFIG% "%ProgramFiles(x86)%\hakchi2\config\config.ini"

echo copy startmenu link ...
copy /Y startmenu\HakChi2.lnk %STARTMENU%

echo ####### %0 #######
pause
