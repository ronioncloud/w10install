@echo off

set T=c:\TEMP
set TOOLS=c:\tools
set ZIP=..\software\mame64.7z
set TARGET=c:\MAME
set CONFIG=config\mame.ini
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %ZIP% (
  echo ERROR: %ZIP% not found!
  exit /b
)

echo ####### %0 #######

echo killing MAME64 processes...
taskkill /F /IM hakchi.exe 2>nul

rem create directory ...
mkdir %TARGET% 2>nul

echo unpacking MAME64 ...
%TOOLS%\7z x -y -aoa -o%T%\mame %ZIP%

echo moving files ...
move /Y %T%\mame\mame64.exe %TARGET%
move /Y %T%\mame\mame64.sym %TARGET%
mkdir %TARGET%\roms 2>nul
rd /S /Q %T%\mame
echo.

echo copy ini file ...
copy /Y %CONFIG% %TARGET%

echo copy startmenu link ...
copy /Y startmenu\MAME64.lnk %STARTMENU%

echo ####### %0 #######
pause
