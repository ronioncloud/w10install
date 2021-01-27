@echo off

set CONFIG1=config\install-sublime.txt
set EXE1=..\software\sublime_text_build_3211_x64_Setup.exe

set CONFIG2=config\install-submerge.txt
set EXE2=..\software\sublime_merge_build_2039_x64_setup.exe

echo ####### %0 #######

echo killing sublime processes...
taskkill /F /IM sublime_text.exe 2>nul
taskkill /F /IM sublime_merge.exe 2>nul

echo installing SUBLIME TEXT ...
%EXE1% /LOADINF=%CONFIG1% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo installing SUBLIME MERGE ...
%EXE2% /LOADINF=%CONFIG2% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo ####### %0 #######

