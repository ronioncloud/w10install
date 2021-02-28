@echo off

set SOURCE=links
set TARGET=%PUBLIC%\Desktop

echo ####### %0 #######

echo copying desktop icons ...
xcopy /CDI /HERBY %SOURCE% %TARGET%

echo ####### %0 #######

