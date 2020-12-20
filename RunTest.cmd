echo off

echo ####### RunTest.cmd #######

mkdir %WINDIR%\Setup 1>nul 2>nul
mkdir %WINDIR%\Setup\Scripts 1>nul 2>nul

copy SetupComplete.cmd %WINDIR%\Setup\Scripts
copy SetupComplete.ftp %WINDIR%\Setup\Scripts

echo ####### RunTest.cmd #######

call %WINDIR%\Setup\Scripts\SetupComplete.cmd

