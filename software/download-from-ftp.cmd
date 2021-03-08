@echo off

rem ===================
rem CONFIGFILE CHECK
rem ===================

if NOT EXIST ftpsettings.cmd (
  echo.
  echo ERROR: ftpsettings.cmd NOT FOUND
  echo.
  echo --- please create with following content ---
  echo set FTP_SERVER=example.com
  echo set FTP_PATH=/path/to/directory
  echo set FTP_USER=myuser
  echo set FTP_PASS=mypass
  exit /b
)

rem ===================
rem COMMANDLINE CHECKS
rem ===================

IF %1.==. GOTO USAGE
rem removing extension ...
set LISTFILE=%~n1
rem adding extension again ...
set LISTFILE=%LISTFILE%.csv

IF NOT EXIST %LISTFILE% (
  echo ERROR: %LISTFILE% not found!
  exit /b
)

echo.
echo loading settings ...
call ftpsettings.cmd
echo ++++++++++++++++++
echo FTP_SERVER=%FTP_SERVER%
echo FTP_PATH=%FTP_PATH%
echo FTP_USER=%FTP_USER%
echo FTP_PASS=xxxxxx
echo ++++++++++++++++++
echo.

echo using list [ %LISTFILE% ] ...

rem ###################################
rem MAIN loop ( DOWNLOAD from ftp ) ...
rem ###################################

FOR /F "tokens=1,2 delims=, " %%E in (%LISTFILE%) do (

  IF NOT EXIST %%F (

    rem get it with curl ...
    echo.
    echo getting: [ %%F ]
    curl -u %FTP_USER%:%FTP_PASS% -L ftp://%FTP_SERVER%/%FTP_PATH%/%%F --output %%F

    rem success ?
    if NOT EXIST %%F (
      echo ERROR: couldn't get %%F!
    ) ELSE (
      rem check size (it SHOULD NOT be 0!)
      FORFILES /M %%F /C "cmd /C if @fsize EQU 0 echo ERROR: file @relpath is zero size!"
    )

  ) ELSE (
    FORFILES /M %%F /C "cmd /C if @fsize NEQ 0 echo OK: file @relpath is [ @fsize ] bytes"
  )

)

rem =====
rem END
rem =====
GOTO END

:USAGE
echo "usage: %0 <LISTFILE>"
echo   LISTFILE = basic, browser, optional or other
echo.

:END
