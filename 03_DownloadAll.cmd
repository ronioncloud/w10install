@echo off

rem check for software directory ...
if NOT EXIST software (
  echo ERROR: directory [ software ] NOT FOUND!
  echo ABORT.
  exit /b
) else (
  cd software
)

clear
echo ================================================
echo START download of software from SOURCE sites ... 
echo ================================================
date /t
time /t
echo.

rem start downloads ...
for %%D in (

  basic
  browser
  optional

) do (

  echo ########## [ %%D ] SOFTWARE ##########
  call download-from-source.cmd %%D
  echo.

)

rem go back ...
cd ..

echo.
date /t
time /t
echo ======
echo READY.
echo ======

