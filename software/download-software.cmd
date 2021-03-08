@echo off

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

echo using list [ %LISTFILE% ] ...

rem ###################################
rem MAIN loop ( download software ) ...
rem ###################################

FOR /F "tokens=1,2 delims=, " %%E in (%LISTFILE%) do (

  rem file is already present ?
  IF %%~zF EQU 0 (
    del /F %%F 2>nul
    echo INFO: [ %%F ] does not exist or is 0 bytes, starting download ...
  )

  IF NOT EXIST %%F (

    rem get it with curl ...
    echo.
    echo getting: %%F [ %%E ]
    curl --connect-timeout 5 --fail-early -L %%E --output %%F

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
echo   LISTFILE = basic, browser or optional
echo.

:END
