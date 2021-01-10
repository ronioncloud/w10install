@echo off
set T=c:\TEMP
set W10=%T%\W10

rem ===================
rem COMMANDLINE CHECKS
rem ===================

IF %1.==. GOTO USAGE

rem get fullpath of isofile ...
set ISOFILE=%~f1

if NOT EXIST %ISOFILE% (
  echo ERROR: file %ISOFILE% not found!
  exit /b
)

rem =====
rem MAIN
rem =====

echo preparing %T% ...
mkdir %T% 1>nul 2>nul
rd /S /Q %W10% 1>nul 2>nul
mkdir %W10% 1>nul 2>nul

echo mounting disk image (iso) with powershell ...
powershell Mount-DiskImage -ImagePath %ISOFILE%

echo copying files from image to targetpath %W10% ...
robocopy \\.\CDROM0 %W10% /MIR /256 /NFL /NDL

echo unmounting disk image (iso) ...
powershell Dismount-Diskimage -ImagePath %ISOFILE%

rem =====
rem END
rem =====
GOTO END

:USAGE
echo "usage: %0 <ISOFILE>"

:END

