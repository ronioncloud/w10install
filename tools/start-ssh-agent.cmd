@echo off
set TOOLS=c:\tools

rem set SOCKET for "ssh-add" ...
echo set SSH_AUTH_SOCK=%TEMP%\ssh-agent.txt
set SSH_AUTH_SOCK=%TEMP%\ssh-agent.txt
set GIT_SSH=%TOOLS%\git\usr\bin\ssh.exe

tasklist /FI "USERNAME eq %USERNAME%" /FI "IMAGENAME eq ssh-agent.exe" | findstr ssh-agent.exe
IF %ERRORLEVEL% GTR 0 (
  attrib -S %TEMP%\ssh-agent.txt
  del /f /s /q %TEMP%\ssh-agent.txt 1>nul 2>nul
  ssh-agent -a %TEMP%\ssh-agent.txt
  ssh-add
) ELSE (
  echo SSH agent is running.
)

