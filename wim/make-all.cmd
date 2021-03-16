@echo off
clear

echo =====
echo START
echo =====
date /t
time /t
echo.

for %%S in (

  mount-boot.cmd
  finish-boot.cmd

  export-image.cmd
  mount-image.cmd
  remove-apps.cmd
  remove-packages.cmd
  finish-image.cmd

) do (

  echo ########## calling [ %%S ] ##########
  call %%S
  echo.

)

echo.
date /t
time /t
echo =====
echo END
echo =====

