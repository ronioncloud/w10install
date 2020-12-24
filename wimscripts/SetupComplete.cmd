@echo off
set SCRIPTS=%WINDIR%\Setup\scripts

rem Disable Windows Hi Animation ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f

rem allow execution of any powershell script ...
powershell -Command ^
"if (Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine) { 'POWERSHELL: Execution Policy set to ALL' }"

rem call powershell stuff ...
powershell %SCRIPTS%\SetupComplete.ps1

