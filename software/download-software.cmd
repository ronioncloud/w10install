@echo off
set LISTFILE=softwarelist.csv

IF NOT EXIST %LISTFILE% (
  echo ERROR: %LISTFILE% not found!
  exit /b
) 

rem ###################################
rem MAIN loop ( download software ) ...
rem ###################################

FOR /F "tokens=1,2 delims=, " %%E in (%LISTFILE%) do (
  echo getting: [ %%E ] from [ %%F ]

  curl -L %%E --output %%F

  IF %%~zF == 0 (
    echo ERROR: size of %%F is 0 bytes
    del /F %%F
  ) ELSE (
    echo INFO: size of %%F is %%~zF bytes
  )

  if NOT EXIST %%F (
  echo ERROR: couldn't get %%F! 
    exit /b
  )

)
