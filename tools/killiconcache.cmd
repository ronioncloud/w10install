@echo off
taskkill /f /IM explorer.exe
del /f /s /q %LocalappData%\Microsoft\Windows\Explorer\*.*
del /f /s /q %LocalappData%\Iconcache.db
shutdown -g -t 0

