set SOURCES=c:\TEMP\Win10\sources

del %SOURCES%\install.wim

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.esd ^
  /DestinationImageFile:%SOURCES%\install.wim ^
  /SourceIndex:6 ^
  /Compress:Max ^
  /CheckIntegrity

