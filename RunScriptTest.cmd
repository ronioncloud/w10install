@echo off

echo ####### %0 #######

copy /Y 1st-logon.cmd D:\
copy /Y ToolsDownload.ftp D:\

echo ####### %0 #######

call D:\1st-logon.cmd

