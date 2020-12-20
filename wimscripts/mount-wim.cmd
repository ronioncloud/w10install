set SOURCES="c:\TEMP\Win10\sources"
set MNT="c:\TEMP\WIM"

mkdir %MNT%
dism /Mount-Wim /WimFile:%SOURCES%\install.wim /Name:"Windows 10 Pro N" /MountDir:%MNT%

