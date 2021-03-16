@echo off
set SOURCES=c:\TEMP\W10\sources
set IMAGE=install_FINAL.esd
set ALTIMAGE=install_FINAL_lastrun.esd

rem ===================
rem COMMANDLINE CHECKS
rem ===================

IF %1.==. GOTO USAGE

set USBDRIVE=%1

if /I %USBDRIVE% == C: (
  echo ERROR: cannot use drive %USBDRIVE% !
  exit /b
)

if NOT EXIST %USBDRIVE% (
  echo ERROR: drive %USBDRIVE% not found!
  exit /b
)

echo.
echo ##########################################
echo using drive %USBDRIVE% ...

rem =====
rem MAIN
rem =====

set answer=
:ask
  set /p answer="BIOS or UEFI setup (B/U)? "
  if /i "%answer:~,1%" EQU "B" (
    echo selected: BIOS
    copy /Y boot\autounattend_BIOS.xml %USBDRIVE%\autounattend.xml
    GOTO CONT
  )
  if /i "%answer:~,1%" EQU "U" (
    echo selected: UEFI
    copy /Y boot\autounattend_UEFI.xml %USBDRIVE%\autounattend.xml
    GOTO CONT
  )
  echo Please type B for BIOS or U for UEFI setup.
  goto ask
:CONT

if EXIST %SOURCES%\%IMAGE% (

  echo.
  echo copying [ %IMAGE% ] to drive %USBDRIVE% ...
  robocopy %SOURCES% %USBDRIVE%\sources %IMAGE% /J /NJH

  rem move image in place ...
  del /F %USBDRIVE%\sources\install.esd 2>nul
  move /Y %USBDRIVE%\sources\%IMAGE% %USBDRIVE%\sources\install.esd

  rem rename image in sources directory ...
  move /Y %SOURCES%\%IMAGE% %SOURCES%\%ALTIMAGE%

) else (

  echo.
  echo INFO: NOT copying image!
  echo.
  echo HINT: please rename
  echo    [ %SOURCES%\%ALTIMAGE% ]
  echo to [ %SOURCES%\%IMAGE% ]
  echo for force copy of image.

)

:CONT
echo.
if EXIST tools (
  echo copying folder tools to drive %USBDRIVE% ...
  robocopy tools %USBDRIVE%\tools /COPY:DT /FFT /XO /256 /NJH /NJS /NDL /XF .gitignore
)

for %%P in (software scripts source optional personal) do (
  if EXIST %%P (
    echo.
    echo copying folder %%P to drive %USBDRIVE%\tools ...
    robocopy %%P %USBDRIVE%\tools\%%P /COPY:DT /FFT /XO /MIR /256 /NJH /NJS /NDL /XF .gitignore /XD .git
  )
)

echo.
echo copying custom setup script to %USBDRIVE% ...
copy /Y boot\CustomSetup.cmd %USBDRIVE%\
echo READY.
echo.

rem =====
rem END
rem =====
GOTO END

:USAGE
echo "usage: %0 <USBDRIVE>"
echo.

:END

