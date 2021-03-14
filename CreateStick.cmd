@echo off

rem ===================
rem COMMANDLINE CHECKS
rem ===================

IF %1.==. GOTO USAGE
IF %2.==. GOTO USAGE

rem get fullpath of isofile ...
set USBDRIVE=%1
set ISOFILE=%~f2

if NOT EXIST %ISOFILE% (
  echo ERROR: file %ISOFILE% not found!
  exit /b
)

if /I %USBDRIVE% == C: (
  echo ERROR: cannot use drive %USBDRIVE% !
  exit /b
)

if NOT EXIST %USBDRIVE% (
  echo ERROR: drive %USBDRIVE% not found!
  exit /b
)

rem =====
rem MAIN
rem =====

echo.
echo ##########################################
echo using drive %USBDRIVE% ...
echo using image %ISOFILE% ...

echo mounting disk image (iso) with powershell ...
powershell Mount-DiskImage -ImagePath %ISOFILE%

echo copying files from image to targetpath %USBDRIVE% ...
robocopy \\.\CDROM0 %USBDRIVE% /MIR /256 /NFL /NDL

echo unmounting disk image (iso) ...
powershell Dismount-Diskimage -ImagePath %ISOFILE%

echo READY.
echo.

rem =====
rem END
rem =====
GOTO END

:USAGE
echo "usage: %0 <USBDRIVE> <ISOFILE>"

:END

