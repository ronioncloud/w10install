rd /S /Q c:\TEMP\Win10
mkdir c:\TEMP\Win10 1>nul 2>nul

powershell Mount-DiskImage -ImagePath "C:\TEMP\Win10.iso"
xcopy /CDI /HERBY D:\* c:\TEMP\Win10
powershell Dismount-Diskimage -ImagePath "C:\TEMP\Win10.iso"

