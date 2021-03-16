@echo off
set IMAGE=c:\TEMP\IMAGE

rem the CHECKFILE is a file that will be monitored against deletion ...
set CHECKFILE=%IMAGE%\Windows\SysWOW64\mf.dll

echo exporting PACKAGE list BEFORE doing any changes ...
install_wim_tweak /p %IMAGE% /l
move /Y Packages.txt Packages-BEFORE.txt

rem ###################################
rem MAIN loop ( remove packages ) ...
rem ###################################

FOR /F %%P in (packages-to-remove.csv) do (

  echo removing PACKAGE [ %%P ] ...
  install_wim_tweak.exe /p %IMAGE% /c "%%P" /r /n

  rem we will exit here in case the checkfile was deleted by a package removal ...
  if NOT EXIST %CHECKFILE% (
    echo ERROR: File %CHECKFILE% was deleted
    exit /b
  )

)

echo CLEANUP ...
del /F SOFTWAREBKP 1>nul 2>nul

echo exporting remaining PACKAGES list ...
install_wim_tweak /p %IMAGE% /l
move /Y Packages.txt Packages-AFTER.txt

rem showing package files ...
dir Packages*.txt

