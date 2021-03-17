@echo off
set OSCDPATH="%ProgramFiles(x86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg"
set OSLABEL=WIN10-AUTO
set ISOFILE=c:\temp\%OSLABEL%.iso

IF %1.==. GOTO USAGE

echo ===================
echo Make ISO file ...
echo ===================
echo.

set USBDRIVE=%1

if /I %USBDRIVE% == C: (
  echo ERROR: cannot use drive %USBDRIVE% !
  exit /b
)

echo using drive [ %USBDRIVE% ] ...

if NOT EXIST %USBDRIVE% (
  echo ERROR: drive %USBDRIVE% not found!
  exit /b
)

rem =====
rem MAIN
rem =====

del /F %ISOFILE% 2>nul

if EXIST %ISOFILE% (
  echo ERROR: cannot delete/create %ISOFILE%!
  echo HINT: maybe it is mounted by Virtualbox or some other tool?
  exit /b
)

%OSCDPATH%\oscdimg -l%OSLABEL% -m -u2 -b%OSCDPATH%\etfsboot.com %USBDRIVE% %ISOFILE%

echo READY.
echo.

rem =====
rem END
rem =====
GOTO END

:USAGE
echo "usage: %0 <USBDRIVE>"

:END

