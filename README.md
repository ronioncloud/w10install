**please read this to get started!**

**IMPORTANT:**
This whole thing was crafted and tested with Windows 10 version 20H2.  
This is actually the only *supported* version!  


*What will you need to run this?*

- a working Windows 10 installation
- a working *commandline* GIT client  
- a windows ISO image or Media creator
- some tools from Microsoft
- some other tools (curl, 7zip etc. pp.)


# 1. Setup your workspace


## 1.1 Create some directories

open cmd.exe and execute:

```dos
mkdir c:\tools
mkdir c:\temp

```


## 1.2 Set needed environment variables

```dos
set TOOLS=c:\tools
set T=c:\TEMP

```

Make them permanent (... in case you open a new cmd window):
```dos
setx TOOLS c:\tools
setx T c:\TEMP

```


# 2. Get/Install basic tools and software


## 2.1 Get 7-zip

[7-ZIP Website](https://www.7-zip.org)

Download: https://www.7-zip.org/a/7z1900-x64.exe  
... and save the executable in folder "software".

Execute the self extracting file:
```dos
software\7z1900-x64.exe

```

Save the contents to: c:\temp.

After extracting execute:
```dos
move /Y %T%\7z.exe %TOOLS%
move /Y %T%\7z.dll %TOOLS%
del /S /Q /A %T%\*.* 1>nul
rd /S /Q %T%\Lang

```


## 2.2 Get curl

[CURL Website](https://curl.se/windows)

Download: https://curl.se/windows/dl-7.75.0_3/curl-7.75.0_3-win64-mingw.zip  
... and save the executable in folder "software".

Extract: the self extracting file:
```dos
%TOOLS%\7z -y -o%T%\curl e software\curl-7.75.0_3-win64-mingw.zip
move /Y %T%\curl\curl.exe %TOOLS%
move /Y %T%\curl\libcurl*.dll %TOOLS%
move /Y %T%\curl\curl-ca-bundle.crt %TOOLS%
rd /S /Q %T%\curl

```


## 2.3 Install GIT

[GIT for windows website](https://git-scm.com)

Download with curl to software folder:
```dos
set URL=https://github.com/git-for-windows/git/releases/download/v2.30.1.windows.1
set EXE=Git-2.30.1-64-bit.exe
%TOOLS%\curl -L %URL%/%EXE% --output software\%EXE%

```

Create the GIT configfile for the setup program (use notepad):
```text
[Setup]
Lang=default
Dir=c:\tools\git
Group=Git
NoIcons=1
SetupType=default
Components=gitlfs
Tasks=
EditorOption=CustomEditor
CustomEditorPath=notepad.exe
DefaultBranchOption= 
PathOption=CmdTools
SSHOption=OpenSSH
TortoiseOption=false
CURLOption=OpenSSL
CRLFOption=CRLFCommitAsIs
BashTerminalOption=ConHost
GitPullBehaviorOption=Merge
UseCredentialManager=Disabled
PerformanceTweaksFSCache=Disabled
EnableSymlinks=Disabled
EnablePseudoConsoleSupport=Disabled
```
Save it to c:\temp\install-git.txt

Execute the Git setup:
```dos
software\%EXE% /LOADINF=c:\temp\install-git.txt /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS
```

Cleanup:
```dos
del /S /Q /A c:\temp\install-git.txt 1>nul

```

2.4 Modify system PATH

WARNING!  
DO NOT execute this in case you have important contents in your path variable!  

Please check you PATH variable with:
```dos
echo %PATH%
```
... and check the contents.  
If necessary modify the command below or extend your path variable via the windows settings GUI!

Execute:
```dos
set PATH=%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%LOCALAPPDATA%\Microsoft\WindowsApps;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin
setx PATH %SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%LOCALAPPDATA%\Microsoft\WindowsApps;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin

```


# 3 Clone this repository

```dos
cd /D %USERPROFILE%
mkdir workspace\github
cd workspace\github
git clone https://github.com/mhgschmidt/w10install.git
cd w10install

```




