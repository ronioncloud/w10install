@echo off

echo ####### %0 #######

echo disable windows ink completely ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" ^
  /v "AllowWindowsInkWorkspace" /t REG_DWORD /d 0 /f 1>nul

echo remove store icon from taskbar ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" ^
  /v "NoPinningStoreToTaskbar" /t REG_DWORD /d 1 /f 1>nul

echo remove defender icon from systray ...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" ^
  /v "SecurityHealth" /f 1>nul 2>nul
taskkill /f /im SecurityHealthSystray.exe 1>nul 2>nul

echo ####### %0 #######

