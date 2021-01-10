@echo off

set CONFIG=install-git.txt
set EXE=..\software\Git-2.29.0-64-bit.exe

echo ####### %0 #######

echo killing ssh processes...
taskkill /F /IM ssh-agent.exe
taskkill /F /IM ssh.exe

echo installing GIT ...
%EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

