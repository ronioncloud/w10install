del c:\TEMP\install.wim
dism /Export-Image ^
  /SourceImageFile:c:\TEMP\Win10\sources\install.esd ^
  /SourceIndex:6 ^
  /DestinationImageFile:c:\TEMP\install.wim ^
  /Compress:Max ^
  /CheckIntegrity

