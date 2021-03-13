@echo off
set SOURCES=c:\TEMP\W10\sources

rem ===================
rem COMMANDLINE CHECKS
rem ===================

IF %1.==. GOTO USAGE
set USBDRIVE=%1

if /I %USBDRIVE% == C: (
  echo ERROR: cannot use drive %USBDRIVE% !
  exit /b
)

echo using drive %USBDRIVE% ...

if NOT EXIST %USBDRIVE% (
  echo ERROR: drive %USBDRIVE% not found!
  exit /b
)

rem =====
rem MAIN
rem =====

set answer=
:ask
  set /p answer="BIOS or UEFI setup (B/U)? "
  if /i "%answer:~,1%" EQU "B" (
    echo selected: BIOS
    copy /Y autounattend_BIOS.xml %USBDRIVE%\autounattend.xml
    GOTO CONT 
  )
  if /i "%answer:~,1%" EQU "U" (
    echo selected: UEFI
    copy /Y autounattend_UEFI.xml %USBDRIVE%\autounattend.xml
    GOTO CONT 
  )
  echo Please type B for BIOS or U for UEFI setup.
  goto ask
:CONT

if EXIST %SOURCES%\install_FINAL.esd (
  echo copying install.esd to drive %USBDRIVE% ...
  robocopy %SOURCES% %USBDRIVE%\sources install_FINAL.esd /J /NJH
  del /F %USBDRIVE%\sources\install.esd 
  move /Y %USBDRIVE%\sources\install_FINAL.esd %USBDRIVE%\sources\install.esd
  move /Y %SOURCES%\install_FINAL.esd %SOURCES%\install_FINAL_lastrun.esd
)

echo.
if EXIST tools (
  echo copying folder tools to drive %USBDRIVE% ...
  robocopy tools %USBDRIVE%\tools /COPY:DT /FFT /XO /256 /NJH /NJS /NDL /XF .gitignore
)

for %%P in (software scripts source optional personal) do (
  if EXIST %%P (
    echo.
    echo copying folder %%P to drive %USBDRIVE%\tools ...
    robocopy %%P %USBDRIVE%\tools\%%P /COPY:DT /FFT /XO /MIR /256 /NJH /NJS /NDL /XF .gitignore
  )
)

echo.
echo copying custom setup script to %USBDRIVE% ...
copy /Y CustomSetup.cmd %USBDRIVE%\

rem =====
rem END
rem =====
GOTO END

:USAGE
echo "usage: %0 <USBDRIVE>"
echo.

:END

