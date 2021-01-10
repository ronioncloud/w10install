@echo off
set LOG=c:\StartCustomSetup.txt
set BATCH=CustomSetup.cmd

if not "%1"=="STDOUT_TO_FILE" %0 STDOUT_TO_FILE %* 1>%LOG% 2>&1
shift /1

echo ####### %0 #######
date /t
time /t
echo.

for %%D in (A B D E F G H I J K L M N O P Q R S T U V W X Y Z) do (

  if EXIST %%D:\%BATCH% (
    echo EXECUTING %%D:\%BATCH% ...
    cd /D %%D:\
    start cmd /C %BATCH%
    GOTO END 
  ) else (
    echo INFO: %BATCH% not found on drive %%D!
  )

)

:END

echo.
date /t
time /t
echo ####### %0 #######

