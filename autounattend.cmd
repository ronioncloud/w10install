echo off

echo ####### autounattend.cmd #######

echo getting 7zip and TOOLS archive from webserver ...
ftp -s:autounattend.ftp

echo extracting TOOLS archive ...
7z x -aoa -oc:\ c:\tools.zip

echo deleting c:\tools.zip ..
del c:\tools.zip

echo ####### autounattend.cmd #######
timeout /t 3

