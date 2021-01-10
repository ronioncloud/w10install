@echo off

set SOURCE=icons
set TARGET=c:\Users\Public\Desktop

echo ####### %0 #######

echo copying desktop icons ...
xcopy /CDI /HERBY %SOURCE% %TARGET%

echo ####### %0 #######

