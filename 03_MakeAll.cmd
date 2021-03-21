@echo off

rem check for wim script directory ...
if NOT EXIST wim (
  echo ERROR: script directory [ wim ] NOT FOUND!
  echo ABORT.
  exit /b
) else (
  cd wim
)

clear
echo ===================================
echo START of image creation process ... 
echo ===================================
date /t
time /t
echo.

echo cleanup ...
del /F Apps*.txt 2>nul
del /F Packages*.txt 2>nul

rem start scripts
for %%S in (

  mount-boot.cmd
  finish-boot.cmd

  export-image.cmd
  mount-image.cmd
  X_remove-apps.cmd
  remove-packages.cmd
  finish-image.cmd

) do (

  echo ########## calling [ %%S ] ##########
  call %%S
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

