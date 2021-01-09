@echo off
set LOG=c:\SetupComplete.txt
set SETUPDIR=c:\Windows\Setup\scripts
set FTPSCRIPT=ToolsDownload.cmd

del /Q %LOG% 1>nul 2>nul
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
echo.

rem allow execution of any powershell script ...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine"
powershell -Command ^
"$R=Get-ExecutionPolicy ; if ($R -eq 'Bypass') { ^
  write-host 'POWERSHELL: Execution Policy was set to BYPASS' ^
} ^
  else { ^
  write-host 'ERROR: CANNOT SET Execution Policy to BYPASS !' ^
}"
echo.

rem call initial download script ...
cd /D %SETUPDIR%
if EXIST %FTPSCRIPT% (
  echo EXECUTING %FTPSCRIPT% ...
  call %FTPSCRIPT%
) else (
  echo INFO: %FTPSCRIPT% not found!
)

echo.
date /t
time /t
echo ####### %0 #######

