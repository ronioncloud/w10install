set SOURCES=c:\TEMP\Win10\sources
set MNT=c:\TEMP\WIM

dism /Image:%MNT% /Cleanup-Image /StartComponentCleanup /ResetBase
dism /Unmount-Wim /MountDir:%MNT% /Commit

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.wim ^
  /DestinationImageFile:%SOURCES%\install_CLEAN.wim ^
  /SourceIndex:1 ^
  /Compress:Max ^
  /CheckIntegrity ^
  & move %SOURCES%\install_CLEAN.wim %SOURCES%\install.wim

dism /Split-Image ^
  /ImageFile:%SOURCES%\install.wim ^
  /SWMFile:%SOURCES%\install.swm ^
  /FileSize:3800

