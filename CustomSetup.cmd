@echo off
rem this script puts everything in place ...

set TOOLS=c:\tools
set SCRIPTS=%TOOLS%\scripts


echo ####### %0 #######

echo killing ssh agent ...
taskkill /F /IM ssh-agent.exe
taskkill /F /IM ssh.exe

echo restart explorer ...
taskkill /F /IM explorer.exe & start explorer.exe

echo deleting %TOOLS% ...
rd /S /Q %TOOLS%

echo copying folder %TOOLS% ...
robocopy tools %TOOLS% /MIR /256 /NJH /NFL /NDL

echo unpacking BGInfo ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\BGInfo.zip
del /F %TOOLS%\BGInfo.zip 1>nul 2>nul

echo unpacking TOTAL commander ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\totalcmd_951.zip
del /F %TOOLS%\totalcmd_951.zip 1>nul 2>nul

echo unpacking notepad++ ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\notepad++.zip
del /F %TOOLS%\notepad++.zip 1>nul 2>nul

echo unpacking ImapCopy ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\ImapCopy.zip
del /F %TOOLS%\ImapCopy.zip 1>nul 2>nul

echo unpacking MediaCreationTool ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\MediaCreationTool20H2.zip
del /F %TOOLS%\MediaCreationTool20H2.zip 1>nul 2>nul

echo ####### %0 #######

echo.
call %SCRIPTS%\CustomSetup2.cmd

