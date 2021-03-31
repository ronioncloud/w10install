@echo off
set SOURCES=c:\TEMP\W10\sources
set BOOT=boot.wim
set IMAGE=install.esd

IF %1.==. GOTO USAGE

echo.
echo =====================
echo Prepare USB Stick ...
echo =====================

set USBDRIVE=%1

if EXIST settings.cmd (
  call settings.cmd
) else (
  set LANG=en-US
)
echo LANG=%LANG%

if /I %USBDRIVE% == C: (
  echo ERROR: cannot use drive %USBDRIVE% !
  exit /b
)

if NOT EXIST %USBDRIVE% (
  echo ERROR: drive %USBDRIVE% not found!
  exit /b
)

echo using drive %USBDRIVE% ...

rem =====
rem MAIN
rem =====

set answer=
:ask
  set /p answer="BIOS or UEFI setup (B/U)? "
  if /i "%answer:~,1%" EQU "B" (
    echo selected: BIOS
    copy /Y boot\autounattend_BIOS_template.xml %USBDRIVE%\autounattend.xml
    GOTO CONT
  )
  if /i "%answer:~,1%" EQU "U" (
    echo selected: UEFI
    copy /Y boot\autounattend_UEFI_template.xml %USBDRIVE%\autounattend.xml
    GOTO CONT
  )
  echo Please type B for BIOS or U for UEFI setup.
  goto ask
:CONT

rem ask for user ...
echo.
set MYUSER=support
set /p MYUSER="Username (%MYUSER%)? "
echo MYUSER = %MYUSER%

rem ask for real name ...
echo.
set MYNAME=Support User
set /p MYNAME="Display Name (%MYNAME%)? "
echo MYNAME = %MYNAME%

rem ask for a password ...
echo.
set MYPASS=
set /p MYPASS="Password (not set)? "
echo MYPASS = %MYPASS%

echo.
tools\searchreplace %USBDRIVE%\autounattend.xml ___MYUSER___ "%MYUSER%"
tools\searchreplace %USBDRIVE%\autounattend.xml ___MYNAME___ "%MYNAME%"
tools\searchreplace %USBDRIVE%\autounattend.xml ___MYPASS___ "%MYPASS%"
tools\searchreplace %USBDRIVE%\autounattend.xml ___MYLANG___ "%LANG%"

echo.
echo copying [ %BOOT% ] to drive %USBDRIVE% ...
robocopy %SOURCES% %USBDRIVE%\sources %BOOT% /J /NJH

if EXIST %SOURCES%\%IMAGE% (

  echo.
  echo copying [ %IMAGE% ] to drive %USBDRIVE% ...
  robocopy %SOURCES% %USBDRIVE%\sources %IMAGE% /J /NJH

) else (

  rem echo.
  echo DOH! no %IMAGE% in [ %SOURCES% ] found
  exit /b

)

:CONT
if EXIST tools (
  echo.
  echo copying folder [ tools ] to drive %USBDRIVE% ...
  robocopy tools %USBDRIVE%\tools /COPY:DT /FFT /XO /256 /NJH /NJS /NDL /XF .gitignore
)

if EXIST software (
  echo.
  echo copying folder [ software ] to %USBDRIVE%\tools ...
  robocopy software %USBDRIVE%\tools\software /COPY:DT /FFT /XO /MIR /256 /NJH /NJS /NDL ^
    /XF *.iso /XF *.txt /XF *.cmd /XF *.csv /XF .gitignore /XD .git
)

for %%P in (scripts source optional personal) do (
  if EXIST %%P (
    echo.
    echo copying folder [ %%P ] to %USBDRIVE%\tools ...
    robocopy %%P %USBDRIVE%\tools\%%P /COPY:DT /FFT /XO /MIR /256 /NJH /NJS /NDL /XF .gitignore /XD .git
  )
)

if EXIST settings.cmd (
  echo.
  echo copying settings file to drive %USBDRIVE% ...
  copy /Y settings.cmd %USBDRIVE%\tools\scripts
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

