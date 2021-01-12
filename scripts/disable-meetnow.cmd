@echo off

echo ####### %0 #######

echo disabling MeetNow for ALL users ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" ^
  /v "HideSCAMeetNow" /d 1 /t REG_DWORD /f
echo FUCK YOU MICROSOFT !

echo ####### %0 #######

