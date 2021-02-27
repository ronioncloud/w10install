echo unpacking TOTAL commander ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\totalcmd_951.zip
del /F %TOOLS%\totalcmd_951.zip 1>nul 2>nul
echo.

echo unpacking notepad++ ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\notepad++.zip
del /F %TOOLS%\notepad++.zip 1>nul 2>nul
echo.

echo unpacking ImapCopy ...
%TOOLS%\7z x -aoa -o%TOOLS% %TOOLS%\ImapCopy.zip
del /F %TOOLS%\ImapCopy.zip 1>nul 2>nul
echo.

echo unpacking MediaCreationTool ...
%TOOLS%\7z x -aoa -o%SOFTWARE% %SOFTWARE%\MediaCreationTool20H2.zip
del /F %SOFTWARE%\MediaCreationTool20H2.zip 1>nul 2>nul
echo.
