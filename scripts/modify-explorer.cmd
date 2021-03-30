@echo off

echo ####### %0 #######

echo disabling network icon ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\NonEnum" ^
  /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d 1 /f 1>nul

echo removing user folders ...
for %%K in (

  {0DB7E03F-FC29-4DC6-9020-FF41B59E513A}
  {B4BFCC3A-DB2C-424C-B029-7FE99A87C641}
  {A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}
  {d3162b92-9365-467a-956b-92703aca08af}
  {374DE290-123F-4565-9164-39C4925E467B}
  {088e3905-0323-4b02-9826-5d99428e115f}
  {1CF1260C-4DD0-4ebb-811F-33C572699FDE}
  {3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}
  {3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}
  {24ad3ad4-a569-4530-98e1-ab02f9417aa8}
  {A0953C92-50DC-43bf-BE83-3742FED03C9C}
  {f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}

) do (

  echo %%K
  rem reg delete ^
    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%%K" /f 2>nul
  rem reg delete ^
    "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%%K" /f 2>nul
  reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons" ^
    /v "%%K" /t REG_DWORD /d 1 /f 2>nul

)

echo restarting explorer ...
taskkill /f /im explorer.exe 1>nul 2>nul
start explorer.exe

echo ####### %0 #######

