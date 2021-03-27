# Windows 10 automated install

## What is all this about?

The installation of systems (professional or private) is a tedious job. In general nobody enjoys this. Nowadays most private individuals also have at least 2 computers. In my case there are 3 PC's in my private office and 3 in my companie's office (I am the company owner). There are also 2 laptops. Mind you: I use these 8 PC's solely for my work and my hobby as a Linux developer.

It doesn't matter whether it's Linux, Windows or Mac OS: You need an automated installation if you want to avoid this waste of time. The installation of the system itself is usually not that much work - but installing and configuring the other applications (e.g. browser, email program, office package, etc.) is often very time-consuming.

Since I am forced to work with Windows on the desktop - for professional reasons - this collection of scripts / this HowTo is exclusively geared towards Windows - and that will not change either.

First I looked for a "professional" solution. Unfortunately I didn't find anything suitable. Sure - there is commercial software (so-called "enterprise" programs) but mostly these are bad or expensive or both or simply not available for normal users or small companies. I'm following the KISS principle privately and professionally - this is why complicated software (aka. bloatware) with agents, whistles and bells etc. pp. was out of the question.

Another major problem is the spying frenzy of software manufacturers. Yes - i mean you Microsoft! So this means primarily the removing of Windows 10 telemetry. But unsolicited updates, by third-party manufacturers, are just as plague. This project takes care of that problem - as far as possible - without impairing the functionality of the system in an intolerable manner. But what is still tolerable? This lies mostly in the eye of the beholder ...

Finally, there is the problem of obesity. Modern systems are getting fatter, slower, more complex and therefore uglier. The whole thing has now reached a level that is no longer acceptable for many users. That is why one of the core tasks of this project is to strip down Windows 10 as much as possible (without loosing to much functionality - see above). This also automatically results in a reduction of the attack surface (programs that do not exist cannot be attacked).


## Project goals

- Provide an automated and unattended Windows 10 installation
- Remove Microsoft's Windows 10 telemetry (as far as possible)
- Remove other annyoing Microsoft "gimmicks" (for e.g.: "Hello" screen)
- Keep the installation *stable* (save install files to your local disk)
- Install the system OFFLINE (aka "airgapped")
- Install 3rd party software automatically
- Configure the system automatically
- Keep It Simple Stupid!

---


# **Please read this to get started!**

**IMPORTANT:**
This whole thing was crafted and tested with Windows 10 version 20H2.  
This is actually the only *supported* version!  


*What will you need to run this?*

- a working Windows 10 installation
- a working *commandline* GIT client  
- a windows ISO image or Windows Media creator
- some tools from Microsoft
- some other tools (curl, 7zip etc. pp.)


# 1. Setup your workspace

Note: This was tested with a standard Windows 10 installation (20H2 v1).


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

Download: https://www.7-zip.org/a/7z1900-x64.msi and save it in your "Downloads" folder.

Unpack the MSI with:
```dos
cd /D %USERPROFILE%\Downloads
move /Y 7z1900-x64.msi 7z-setup.msi
msiexec /a 7z-setup.msi TARGETDIR=%T%
cd ..
```

After extracting execute:
```dos
move /Y %T%\Files\7-Zip\7z.exe %TOOLS%
move /Y %T%\Files\7-zip\7z.dll %TOOLS%
del /S /Q /A %T%\7z-setup.msi 1>nul 2>nul
rd /S /Q %T%\Files
```


## 2.2 Get curl

[CURL Website](https://curl.se/windows)

Download: https://curl.se/windows/dl-7.75.0_3/curl-7.75.0_3-win64-mingw.zip and save it in your "Downloads" folder.

Extract: the self extracting file:
```dos
cd /D %USERPROFILE%\Downloads
move /Y curl*.zip curl.zip
%TOOLS%\7z -y -o%T%\curl e curl.zip
move /Y %T%\curl\curl.exe %TOOLS%
move /Y %T%\curl\libcurl*.dll %TOOLS%
move /Y %T%\curl\curl-ca-bundle.crt %TOOLS%
rd /S /Q %T%\curl
cd ..
```


## 2.3 Install GIT

[GIT for windows website](https://git-scm.com)

Download with curl to software folder:
```dos
cd /D %USERPROFILE%\Downloads
%TOOLS%\curl -L https://github.com/git-for-windows/git/releases/download/v2.30.1.windows.1/Git-2.30.1-64-bit.exe --output git-setup.exe
cd ..
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
Save it as c:\temp\install-git.txt

Execute the Git setup:
```dos
cd /D %USERPROFILE%\Downloads
git-setup.exe /LOADINF=c:\temp\install-git.txt /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS
cd ..
```

Cleanup:
```dos
del /S /Q /A c:\temp\install-git.txt 1>nul
```


## 2.4 Modify system PATH

You need to extend your PATH variable with the following directories:

```text
%TOOLS%
%TOOLS%\git\bin
%TOOLS%\git\usr\bin
```

Or (in case you are fine with our path settings) execute:
```dos
set PATH=%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%LOCALAPPDATA%\Microsoft\WindowsApps;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin
setx PATH %SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%LOCALAPPDATA%\Microsoft\WindowsApps;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin
```


# 3. Clone this repository

```dos
cd /D %USERPROFILE%
mkdir workspace\github
cd workspace\github
git clone https://github.com/mhgschmidt/w10install.git
cd w10install
```


# 4. Get essential building tools and software

You can download almost all needed software with the script "01_DownloadAll.cmd".

To do this execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install
01_DownloadAll.cmd
```


## 4.1 Basic software

The "basic" software is needed to make this work.

Execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install\software
download-from-source.cmd basic
```

Config file: basic.csv


## 4.2 Browser software

This contains firefox and some addons ...

To download it execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install\software
download-from-source.cmd browser
```

Config file: browser.csv


## 4.3 Optional software

This contains optional software. For e.g.: Purebasic, TotalCommander, em-Client, Steam, Softmaker, Purebasic, Teams, Visual Studio Code etc. pp. ...

To download it execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install\software
download-from-source.cmd optional
```

Config file: optional.csv

Notice: Purebasic is needed to compile the software in the folder "source". These tools are precompiled and i placed the compiled versions in the folder "tools" - but in case you want to make some changes you will have to install this. The free version is sufficient to compile these little machine programs. By the way: Purebasic is a really great Basic dialect. It is Ultrafast, produces really small executables, it's rock solid and you won't need such bullshit like "vbrun100.dll" (shame on you Microsoft) to execute these binaries. It was created by a french programmer (Frederic Laboureur). Please support them and buy a licence in case you like Purebasic!


## 4.4 Windows 10 ISO file

My actual work is based on the English version of Windows 20H2 v1 64-bit. So we will need the ISO-file: "Win10_20H2_English_x64.iso". You could: 

- download it yourself from Microsoft,
- you could use the tool "MediaCreationTool20H2.exe" (provided in the folder "software")
- or you could use the "HeiDoc" Windows ISO Downloader

I prefer to use the Windows ISO downloader ("Windows-ISO-Downloader.exe" in the folder "software").

Just start it (no installation needed) and select "Windows 10" on the right side.

Select edition (left side) and choose "Windows 10 Home/Pro" from "Windows 10 Version 20H2 - October 2020".

**Please DO NOT USE the v2 version! This is not tested yet (you have been warned)!**

Click "Confirm".

Select "English"

**Please DO NOT USE "International English" or some other language!**

Click "Confirm"

Click "64-bit download"

Save the ISO file to the folder "iso" in the folder "w10install" and wait for the download to finish.


# 5. Extract the Windows 10 ISO file

The ISO file must be extacted to the disk now. The files will be place in c:\temp. The script "02_ExtractIso.cmd" does all the work.

Just execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install
02_ExtractIso.cmd iso\Win10_20H2_English_x64.iso
```
