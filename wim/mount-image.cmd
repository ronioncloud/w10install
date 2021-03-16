@echo off
set SOURCES=c:\TEMP\W10\sources
set IMAGE=c:\TEMP\IMAGE

echo creating image mountpoint ...
mkdir %IMAGE% 1>nul 2>nul

echo mounting install.IMAGE to %IMAGE% ...
dism /Mount-IMAGE /IMAGEFile:%SOURCES%\install.wim /Name:"Windows 10 Pro" /MountDir:%IMAGE%

