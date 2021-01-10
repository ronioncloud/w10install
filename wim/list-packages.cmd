@echo off
set MNT=c:\TEMP\WIM

dism /Image:%MNT% /Get-Packages /Format:Table

