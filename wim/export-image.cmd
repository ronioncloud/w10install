@echo off
set SOURCES=c:\TEMP\W10\sources

echo deleting old install.wim ...
del %SOURCES%\install.wim 1>nul 2>nul

echo exporting WIM image from %SOURCES%\install.esd ...
dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.esd ^
  /DestinationImageFile:%SOURCES%\install.wim ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Max ^
  /CheckIntegrity
