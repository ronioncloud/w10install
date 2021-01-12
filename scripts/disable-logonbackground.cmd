@echo off

echo ####### %0 #######

echo disabling logon screen background ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" ^
  /v DisableLogonBackgroundImage /t REG_DWORD /d 1 /f

echo ####### %0 #######

