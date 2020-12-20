set SOURCES="c:\TEMP\Win10\sources"

del %SOURCES%\install.wim

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.esd ^
  /SourceIndex:6 ^
  /DestinationImageFile:%SOURCES%\install.wim ^
  /Compress:Max ^
  /CheckIntegrity

