@echo off
set SOURCES=c:\TEMP\W10\sources

rem ===================
rem COMMANDLINE CHECKS
rem ===================

IF %1.==. GOTO USAGE
set USBDRIVE=%1

if NOT EXIST %USBDRIVE% (
  echo ERROR: file %USBDRIVE% does not exist!
  exit /b
)

if /I %USBDRIVE% == C: (
  echo ERROR: cannot use drive %USBDRIVE% !
  exit /b
)


rem =====
rem MAIN
rem =====

echo using drive %USBDRIVE% ...

if NOT EXIST %USBDRIVE% (
  echo ERROR: drive %USBDRIVE% not found!
  exit /b
)

:ask
  set /p answer="BIOS or UEFI setup (B/U)? "
  if /i "%answer:~,1%" EQU "B" (
    copy /Y autounattend_BIOS.xml %USBDRIVE%\autounattend.xml
    GOTO CONT 
  )
  if /i "%answer:~,1%" EQU "U" (
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
  move /Y %SOURCES%\install_FINAL.esd %SOURCES%\install_FINAL_copy.esd
)

for %%P in (tools software scripts) do (
  if EXIST %%P (
    echo.
    echo copying folder %%P to drive %USBDRIVE% ...
    robocopy %%P %USBDRIVE%\%%P /COPY:DT /FFT /XO /MIR /256 /NJH /NJS /NDL /XF .gitignore
    del /F %USBDRIVE%\%%P\.gitignore 1>nul 2>nul
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

:END

