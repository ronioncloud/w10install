set SOURCES="c:\TEMP\Win10\sources"
set MNT="c:\TEMP\WIM"

dism /Unmount-Wim /MountDir:%MNT% /Discard
dism /Cleanup-Wim 

