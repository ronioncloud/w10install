@echo off

set TOOLS=c:\tools
set ZIP=..\software\winauth.zip
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %ZIP% (
  echo ERROR: %ZIP% not found!
  exit /b
)

echo ####### %0 #######

echo killing WinAuth processes...
taskkill /F /IM winauth.exe 2>nul

echo unpacking WinAuth ...
%TOOLS%\7z x -y -aoa -o"%TOOLS%" %ZIP%

echo copy startmenu link ...
copy /Y startmenu\WinAuth.lnk %STARTMENU%
copy /Y startmenu\WinAuth.lnk %PUBLIC%\Desktop

echo ####### %0 #######
pause

