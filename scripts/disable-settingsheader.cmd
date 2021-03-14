@echo off
set TOOLS=c:\tools

echo ####### %0 #######

rem Dear Microsoft, please stop adding STUPID features to windows!
rem Rewards ? Really ? Seriously ?
echo disabling nag screen in windows settings ...
%TOOLS%\vivetool delconfig 18299130 1

echo ####### %0 #######

