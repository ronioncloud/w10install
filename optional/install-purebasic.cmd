@echo off
set T=c:\TEMP
set TOOLS=c:\tools

set CONFIG=config\install-purebasic.txt
set EXE=..\software\purebasic-setup.exe
set ZIP=..\software\purebasic.zip

echo killing PureBasic processes...
taskkill /F /IM PureBasic.exe 2>nul
taskkill /F /IM pbcompiler.exe 2>nul

if NOT EXIST %EXE% if NOT EXIST %ZIP% (
  echo WARNING: no PureBasic zipfile or exe-installer found!
  goto END
)

echo ####### %0 #######

if EXIST %EXE% (
  echo INFO: %EXE% found!

  rem remove old links ...
  del /F /Q /A %PUBLIC%\Desktop\PureBasic*.lnk 2>nul

  echo installing purebasic ...
  %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS
  goto LINK
)

if EXIST %ZIP% (
  echo INFO: %ZIP% found!

  rem remove old links ...
  del /F /Q /A %PUBLIC%\Desktop\PureBasic*.lnk 2>nul

  %TOOLS%\7z e -y -aoa -o%T%\purebasic %ZIP%
  move /Y %T%\purebasic\PureBasic*.exe %T%\purebasic\purebasic-setup.exe

  echo installing purebasic ...
  %T%\purebasic\purebasic-setup.exe /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

  echo cleanup ...
  rd /S /Q %T%\purebasic 2>nul  
  goto LINK
)

:LINK
echo copy new PureBasic link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PureBasic\PureBasic (x64).lnk" ^
  %PUBLIC%\Desktop\PureBasic.lnk

echo ####### %0 #######
:END
pause

