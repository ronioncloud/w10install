set SOURCES=c:\TEMP\Win10\sources

del %SOURCES%\install.wim 1>nul 2>nul

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.esd ^
  /DestinationImageFile:%SOURCES%\install.wim ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Max ^
  /CheckIntegrity

