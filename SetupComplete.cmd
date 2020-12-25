@echo off
rem SetupComplete.cmd ...

echo ####### %0 #######

echo Disable Windows "Hi" Animation ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" ^
  /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" ^
  /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f

echo ####### %0 #######

