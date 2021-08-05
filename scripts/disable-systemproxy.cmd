@echo off

echo ####### %0 #######

echo disabling automatic proxy search ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^
  /v AutoDetect /t REG_DWORD /d 0 /f

echo disabling system proxy use ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^
  /v ProxyEnable /t REG_DWORD /d 0 /f

echo ####### %0 #######

