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


# 6. Install build tools

## 6.1 Windows ADK

This is needed to be able to edit the Microsoft XML files (needed for unattended installation) and for the creation of ISO files (last step in the build process - mainly needed for testing purposes).

To install it just execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install\scripts
install-adk.cmd
```

## 6.2 Other tools

Creating a new windows image and removing "builtin" packages needs a tool called "install_wim_tweak". To install this tool an some others just execute:

```dos
cd /D %USERPROFILE%\workspace\github\w10install\scripts
unpack-zipfiles.cmd
```


# 7. Build the Windows Image for unattended installations

This is a very long running and CPU intensive task. I recommend a 3 GHZ six core machine with 16 GB RAM. Many things will be done here:

- extract the boot image (WIM file) and add tools to provide a boot menu etc. pp.
- extract Windows image (WIM file) and choose Windows 10 Pro version
- remove all apps from the windows image (except the Store app!)
- remove many packages from the windows image (including defender!)
- etc. pp.

**Start cmd.exe as ADMINISTRATOR!**

Execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install
03_MakeAll.cmd
```

Be patient: This whole process could run 1 - 3 hours.


# 8. Create Boot media

This has to be done in 3 steps:
- format a media (USB stick)
- create a standard Windows 10 boot media
- copy everything (custom image, software, config) to the media


## 8.1 Format USB stick

Please use a fast USB 3 stick. The size should be 16 GB or more (you could use 8 GB but windows images are tending to get bigger and bigger. Additionally: We will copy lots of 3rd party software to the stick).

To create it execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install
04_FormatStick.cmd
```

Choose the correct drive (this should be drive 1 or 2)

**WARNING: Please be careful and make absolutely sure NOT TO DELETE any important data!**

Example run:
```text
====================
Format USB Stick ...
====================

Showing disk list ...

Microsoft DiskPart version 10.0.19041.610

Copyright (C) Microsoft Corporation.
On computer: DESKTOP-NN1UC68

  Disk ###  Status         Size     Free     Dyn  Gpt
  --------  -------------  -------  -------  ---  ---
  Disk 0    Online          238 GB  1024 KB
  Disk 1    Online           14 GB      0 B

Leaving DiskPart...
Please select a disk: 1
OK using disk 1
Please enter a label for the new disk: W1020H2v1
WARNING ! This will DELETE ALL data on disk number [ 1 ]

REALLY delete disk 1 (Y/N)? y
READY.
USB stick formatted.
```


## 8.2 Create standard Windows media

The next script needs the ISO file again and will create a standard boot media with an UNMODIFIED windows 10 version. This is a good way to create a standard windows media without being forced to use Windows media creator or other rubbish tools.

Just execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install
05_CreateStick.cmd D: iso\Win10_20H2_English_x64.iso
```

After creating the stick with this script you can use it for a standard Windows 10 installation!

Example run:
```text
====================
Create USB Stick ...
====================
using drive D: ...
using image C:\Users\support\workspace\github\w10install\iso\Win10_20H2_English_x64.iso ...
mounting disk image (iso) with powershell ...

[...]

copying files from image to targetpath D: ...

-------------------------------------------------------------------------------
   ROBOCOPY     ::     Robust File Copy for Windows
-------------------------------------------------------------------------------

[...]

unmounting disk image (iso) ...

[...]

READY.
```

## 8.3 Copy custom image to boot media

Now it's time to copy the custom windows image, alls scripts and additional 3rd party software to our boot media (USB stick).

Execute:
```dos
cd /D %USERPROFILE%\workspace\github\w10install
06_Copy2Stick.cmd D:
```

IMPORTANT HINT: the script will ask for UEFI or BIOS mode. This means: In case you have a target machine that cannot boot in UEFI mode choose "BIOS" (or "B"). In all other cases UEFI may be a better choice. You can boot most modern boards in "BIOS" mode. Just enable "legacy" boot mode in you PC's firmware.

Example run:
```
=====================
Prepare USB Stick ...
=====================
using drive D: ...
BIOS or UEFI setup (B/U)? b
selected: BIOS
        1 file(s) copied.

copying [ boot.wim ] to drive D: ...

[...]

copying [ install_FINAL.esd ] to drive D: ...

[...]

        1 file(s) moved.
        1 file(s) moved.

copying folder [ tools ] to drive D: ...
[...]

copying folder [ software ] to D:\tools ...
[...]

copying folder [ scripts ] to D:\tools ...
[...]

copying folder [ source ] to D:\tools ...
[...]

copying folder [ optional ] to D:\tools ...
[...]

copying custom setup script to D: ...
        1 file(s) copied.
READY.
```

*Congratulations!*

**Your customized windows image for UNATTENDED installation is READY now. Remove the USB stick and put it into a PC you want to install.**



