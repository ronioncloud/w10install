set SOURCES="c:\TEMP\Win10\sources"
set MNT="c:\TEMP\WIM"

dism /Image:%MNT% /Cleanup-Image /StartComponentCleanup /ResetBase
dism /Unmount-Wim /MountDir:%MNT% /Commit

dism /Compress:max /Export-Image ^
  /SourceImageFile:%SOURCES%\install.wim ^
  /Name:"Windows 10 Pro N" ^
  /DestinationImageFile:%SOURCES%\install_CLEAN.wim

