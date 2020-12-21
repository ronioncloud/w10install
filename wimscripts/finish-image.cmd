set SOURCES=c:\TEMP\Win10\sources
set MNT=c:\TEMP\WIM

dism /Image:%MNT% /Cleanup-Image /StartComponentCleanup /ResetBase
dism /Unmount-Wim /MountDir:%MNT% /Commit

dism /Export-Image ^
  /SourceImageFile:%SOURCES%\install.wim ^
  /DestinationImageFile:%SOURCES%\install_FINAL.esd ^
  /SourceName:"Windows 10 Pro" ^
  /Compress:Recovery ^
  /CheckIntegrity

