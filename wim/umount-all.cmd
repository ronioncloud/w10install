@echo off
set IMAGE=c:\TEMP\IMAGE
set BOOT=c:\TEMP\BOOT

echo unmounting image and discarding changes ...
dism /Unmount-Wim /MountDir:%IMAGE% /Discard

echo unmounting boot and discarding changes ...
dism /Unmount-Wim /MountDir:%BOOT% /Discard

echo cleaning up ...
dism /Cleanup-Wim 

