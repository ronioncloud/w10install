@echo off
set THEMES=C:\Windows\Resources\Themes

echo ####### %0 #######

copy /Y config\aerolite.theme %THEMES%

echo activating AEROLITE theme ...
@echo on
powershell -command "Start-Process %THEMES%\aerolite.theme"
@echo off

echo ####### %0 #######

