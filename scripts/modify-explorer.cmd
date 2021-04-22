@echo off

echo ####### %0 #######

if EXIST settings.cmd (
  echo loading settings ...
  call settings.cmd
) else (
  echo WARNING: settings.cmd not found!
  echo setting defaults ...
  set explorer_quick_access=1
)

echo ++++++++++++++++++
echo explorer_quick_access=%explorer_quick_access%
echo ++++++++++++++++++
echo.

if %explorer_quick_access% == 0 (
  echo disabling explorer quick access ...
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" ^
    /v "HubMode" /t REG_DWORD /d 1 /f 1>nul
) else (
  echo enabling explorer quick access ...
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" ^
    /v "HubMode" /t REG_DWORD /d 0 /f 1>nul
)

echo disabling network icon ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\NonEnum" ^
  /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d 1 /f 1>nul

echo removing 3d Objects ...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f 1>nul
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f 1>nul

echo restarting explorer ...
taskkill /f /im explorer.exe 1>nul 2>nul
start explorer.exe

echo ####### %0 #######

