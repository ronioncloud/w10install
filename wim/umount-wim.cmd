@echo off
set SOURCES=c:\TEMP\W10\sources
set MNT=c:\TEMP\WIM

echo unmounting wim and discarding changes ...
dism /Unmount-Wim /MountDir:%MNT% /Discard

echo cleaning up ...
dism /Cleanup-Wim 

