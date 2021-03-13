@echo off
set FTPSETTINGS=..\personal\ftpsettings.cmd

rem ===================
rem CONFIGFILE CHECK
rem ===================

if NOT EXIST %FTPSETTINGS% (
  echo.
  echo ERROR: %FTPSETTINGS% NOT FOUND
  echo.
  echo --- please create it as follows ---
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
set UPLOADFILE=%1

IF NOT EXIST %UPLOADFILE% (
  echo ERROR: %UPLOADFILE% not found!
  exit /b
)

echo.
echo loading settings ...
call %FTPSETTINGS%
echo ++++++++++++++++++
echo FTP_SERVER=%FTP_SERVER%
echo FTP_PATH=%FTP_PATH%
echo FTP_USER=%FTP_USER%
echo FTP_PASS=xxxxxx
echo ++++++++++++++++++
echo.

rem ######################################
rem MAIN ( UPLOAD single file to ftp ) ...
rem ######################################

rem UPLOAD with curl ...
echo upload of: [ %UPLOADFILE% ]
curl -u %FTP_USER%:%FTP_PASS% -T %UPLOADFILE% ftp://%FTP_SERVER%/%FTP_PATH%/
GOTO END

:USAGE
echo "usage: %0 <UPLOADFILE>"
echo.

:END
