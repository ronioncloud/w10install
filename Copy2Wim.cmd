@echo off
set MNT="c:\TEMP\WIM"

echo ####### Copy2Wim.cmd #######

mkdir %MNT%\Windows\Setup 1>nul 2>nul
mkdir %MNT%\Windows\Setup\Scripts 1>nul 2>nul

copy SetupComplete.cmd %MNT%\Windows\Setup\Scripts
copy SetupComplete.ftp %MNT%\Windows\Setup\Scripts

echo ####### Copy2Wim.cmd #######

