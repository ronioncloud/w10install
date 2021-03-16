@echo off
set SOURCES=c:\TEMP\W10\sources
set BOOT=c:\TEMP\BOOT

echo creating wim mountpoint for BOOT ...
mkdir %BOOT% 1>nul 2>nul

echo set write access for boot.wim ..
attrib -R %SOURCES%\boot.wim

echo mounting boot.wim to %BOOT% ...
dism /Mount-Wim /WimFile:%SOURCES%\boot.wim /Name:"Microsoft Windows Setup (x64)" /MountDir:%BOOT%

