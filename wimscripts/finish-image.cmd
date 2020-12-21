set SOURCES=c:\TEMP\Win10\sources
set MNT=c:\TEMP\WIM

rem dism /Image:%MNT% /Cleanup-Image /StartComponentCleanup /ResetBase
rem dism /Unmount-Wim /MountDir:%MNT% /Commit

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install_FINAL.wim ^
  /DestinationImageFile:%SOURCES%\install_FINAL.esd ^
  /SourceIndex:1 ^
  /Compress:Recovery ^
  /CheckIntegrity

