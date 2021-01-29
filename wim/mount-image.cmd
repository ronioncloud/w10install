@echo off
set SOURCES=c:\TEMP\W10\sources
set MNT=c:\TEMP\WIM

echo creating wim mountpoint ...
mkdir %MNT% 1>nul 2>nul

echo mounting install.wim to %MNT% ...
dism /Mount-Wim /WimFile:%SOURCES%\install.wim /Name:"Windows 10 Pro" /MountDir:%MNT%

