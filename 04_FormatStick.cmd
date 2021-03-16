@echo off
set T=c:\TEMP
set DPARTSCRIPT=%T%\diskpart.txt

rem create temp directory and cleanup ...
mkdir %T% 1>nul 2>nul
del /Y %DPARTSCRIPT% 1>nul 2>nul

echo ====================
echo Format USB Stick ...
echo ====================

echo.
echo Showing disk list ...
> %DPARTSCRIPT% (
    @echo.list disk
    @echo.exit
    @echo.
)
diskpart /s %DPARTSCRIPT% 2>nul

set DISK=
:askdisk
  set /p DISK="Please select a disk: "

  > %DPARTSCRIPT% (
      @echo.select disk %DISK%
      @echo.exit
      @echo.
  )

  diskpart /s %DPARTSCRIPT% 1>nul 2>nul
  if %errorlevel% EQU 0 (
    echo OK using disk %DISK%
    GOTO CONT1
  ) else (
    echo ERROR: please select a valid disk number!
  )

  goto askdisk
:CONT1

set LABEL=
set /p LABEL="Please enter a label for the new disk: "

echo WARNING ! This will DELETE ALL data on disk number [ %DISK% ]
echo.
set answer=
:askyes
  set /p answer="REALLY delete disk %DISK% (Y/N)? "
  if /i "%answer:~,1%" EQU "Y" (
    GOTO CONT2
  )
  if /i "%answer:~,1%" EQU "N" (
    echo ABORT.
    exit /b
  )
  echo Please type Y or N.
  goto askyes
:CONT2

rem =====
rem MAIN
rem =====

> %DPARTSCRIPT% (
  @echo.select disk %DISK%
  @echo.clean
  @echo.create partition primary
  @echo.select partition 1
  @echo.format fs=fat32 LABEL="%LABEL%" quick
  @echo.active
  @echo.exit
  @echo.
)

diskpart /s %DPARTSCRIPT% 1>nul 2>nul
if %errorlevel% NEQ 0 (
  echo ERROR: while formatting the disk!
  exit /b
)
echo READY. 
echo USB stick formatted.
echo.

rem =====
rem END
rem =====
