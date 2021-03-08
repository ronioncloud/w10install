@echo off

set SOURCE=links
set TARGET="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

echo ####### %0 #######

echo copying desktop icons ...
xcopy /CDI /HERBY %SOURCE% %TARGET%

echo ####### %0 #######

