@echo off
set LOG=C:\SetupComplete.txt
set BATCH=SetupComplete.cmd
set PS1=SetupComplete.ps1

if not "%1"=="STDOUT_TO_FILE" %0 STDOUT_TO_FILE %* 1>%LOG% 2>&1
shift /1

echo ####### %0 #######
date /t
time /t
echo.

echo Disable Windows "Hi" Animation ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" ^
  /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" ^
  /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f

rem allow execution of any powershell script ...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine"
powershell -Command ^
"$T=Get-ExecutionPolicy ; if ($T -eq 'Bypass') { ^
  write-host 'POWERSHELL: Execution Policy was set to BYPASS' ^
} ^
  else { ^
  write-host 'ERROR: CANNOT SET Execution Policy to BYPASS !' ^
}"
echo.

rem try to call a script...
for %%D in (H G F E D) do (
  if EXIST %%D:\%PS1% (
    echo EXECUTING %PS1% on drive %%D ...
    powershell -Command %%D:\%PS1%
  ) else (
    echo INFO: %PS1% not found on drive %%D!
  )

  if EXIST %%D:\%BATCH% (
    echo EXECUTING %BATCH% on drive %%D ...
    call %%D:\%BATCH%
  ) else (
    echo INFO: %BATCH% not found on drive %%D!
  )

)

echo.
date /t
time /t
echo ####### %0 #######

