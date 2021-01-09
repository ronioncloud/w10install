set W10=c:\TEMP\Win10

rd /S /Q %W10% 1>nul 2>nul
mkdir %W10% 1>nul 2>nul

powershell Mount-DiskImage -ImagePath %W10%.iso
robocopy \\.\CDROM0 %W10% /MIR /256
powershell Dismount-Diskimage -ImagePath %W10%.iso
