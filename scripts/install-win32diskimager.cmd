@echo off

set EXE=..\software\win32diskimager.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing WIN32DISKIMAGER ...
%EXE% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo changing startmenu folder ...
move /Y %STARTMENU%\"Image Writer\Win32DiskImager.lnk" %STARTMENU%

echo removing win32diskimager startmenu folder ...
rd /S /Q %STARTMENU%\"Image Writer" 2>nul

echo ####### %0 #######
