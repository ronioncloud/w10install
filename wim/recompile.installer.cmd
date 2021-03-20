@echo off

rem remount boot image and recompile installer ...

del /F installer.exe 1>nul 2>nul
echo +++++++++++++++++++++++++++++++++++
call pbc.cmd ..\source\installer.pb
echo +++++++++++++++++++++++++++++++++++
call umount-all.cmd
echo +++++++++++++++++++++++++++++++++++
call mount-boot.cmd
echo +++++++++++++++++++++++++++++++++++
call finish-boot.cmd
echo +++++++++++++++++++++++++++++++++++

