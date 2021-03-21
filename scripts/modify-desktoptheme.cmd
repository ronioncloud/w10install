@echo off
set THEMES=C:\Windows\Resources\Themes

echo ####### %0 #######

copy /Y config\aerolite.theme %THEMES%

echo activating AEROLITE theme ...
@echo on
powershell -command "Start-Process %THEMES%\aerolite.theme"
@echo off

echo sleep 10 seconds ...
ping 127.0.0.1 -n 10 > NUL 2>&1

taskkill /F /IM SystemSettings.exe 2>nul

echo ####### %0 #######

