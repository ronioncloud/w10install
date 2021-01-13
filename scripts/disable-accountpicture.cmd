@echo off

set TARGET="%ALLUSERSPROFILE%\Microsoft\User Account Pictures"

echo ####### %0 #######

echo disabling account pictures on logon screen ...
move /Y %TARGET%\user-192.png %TARGET%\user-192.bak
copy /Y config\user-192.png %TARGET%

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" ^
  /v UseDefaultTile /t REG_DWORD /d 1 /f

echo ####### %0 #######

