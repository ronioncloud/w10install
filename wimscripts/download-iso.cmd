@echo off
mkdir c:\TEMP 1>nul 2>nul

set ISOGLOB=c:\TEMP\Win10*.iso
set ISO=c:\TEMP\Win10.iso

del %ISOGLOB% 1>nul 2>nul
ftp -i -s:download-iso.ftp
move %ISOGLOB% %ISO%

