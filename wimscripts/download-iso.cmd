set ISOGLOB=c:\TEMP\Win10*.iso
set ISO=c:\TEMP\Win10.iso

del %ISOGLOB%
ftp -i -s:download-iso.ftp
move %ISOGLOB% %ISO%

