@echo off
set T=c:\TEMP
set TOOLS=c:\tools

set CONFIG=config\install-purebasic.txt

rem licensed version (exe contains key!)
rem access only for customers ...
set EXE=..\personal\purebasic-setup.exe

rem demo version (publically accessible)
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
  echo INFO: %EXE% found, installing licensed version ...

  rem remove old links ...
  del /F /Q /A %PUBLIC%\Desktop\PureBasic*.lnk 2>nul

  echo installing purebasic ...
  start /wait %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL ^
    /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS
  goto LINK
)

if EXIST %ZIP% (
  echo INFO: %ZIP% found, installing demo version ...

  rem remove old links ...
  del /F /Q /A %PUBLIC%\Desktop\PureBasic*.lnk 2>nul

  %TOOLS%\7z e -y -aoa -o%T%\purebasic %ZIP%
  move /Y %T%\purebasic\PureBasic*.exe %T%\purebasic\purebasic-setup.exe

  echo installing purebasic ...
  start /wait %T%\purebasic\purebasic-setup.exe ^
    /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

  echo cleanup ...
  rd /S /Q %T%\purebasic 2>nul  
  goto LINK
)

:LINK
rem remove personal link ...
del /F /Q /A %USERPROFILE%\Desktop\PureBasic*.lnk 2>nul

echo copy new PureBasic link to desktop ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PureBasic\PureBasic (x64).lnk" ^
  %PUBLIC%\Desktop\PureBasic.lnk

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######
:END
pause

