# Windows 10 automated install

## What is all this about?

The installation of systems (professional or private) is a job that has to be done again and again. Generally nobody enjoys this. Nowadays most private individuals also have at least 2 computers. In my case there are 3 PCs in my private office and 3 in my company office (I am the company owner). There are also 2 laptops. Mind you: I use these 8 PCs solely for my work and my hobby as a Linux developer.

It doesn't matter whether it's Linux, Windows or Mac OS: You need an automated installation if you want to avoid this waste of time. The installation of the system itself is usually not that much work - but installing and configuring the other applications (e.g. browser, email program, office package, etc.) is often very time-consuming.

Since I am forced to work with Windows on the desktop - for professional reasons - this collection of scripts / this HowTo is exclusively geared towards Windows - and that will not change either.

First I looked for a "professional" solution. Unfortunately I didn't find anything suitable. Sure - there is commercial software (so-called "enterprise" programs) but mostly these are bad or expensive or both or simply not available for normal users or small companies. I also follow the KISS principle privately and professionally - so complicated software with agents etc. was out of the question.

Another major problem is the spying frenzy of software manufacturers. This primarily means Windows 10 telemetry. But unsolicited updates, whether by Microsoft or third-party manufacturers, are just as plague. This project also takes care of that - as far as possible - without impairing the functionality of the system in an intolerable manner. But what is still tolerable? This lies in the eye of the beholder.

Finally, there is the problem of obesity. Modern systems are getting fatter, slower, more complex and therefore uglier. The whole thing has now reached a level that is no longer acceptable for many users. That is why one of the core tasks of this project is to strip down Windows 10 as much as possible (without loosing to much functionality - see above). This also automatically results in a reduction of the attack surface (programs that do not exist cannot be attacked).


## Project goals

- Provide an automated and unattended Windows 10 installation
- Remove Microsoft's Windows 10 telemetry (as far as possible)
- Remove other annyoing Microsoft "gimmicks" (for e.g.: Hello screen)
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
Save the executable as "7z-setup.exe" in folder "software".

Execute the self extracting file:
```dos
software\7z-setup.exe

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
Save the zipfile as "curl.zip" in folder "software".

Extract: the self extracting file:
```dos
%TOOLS%\7z -y -o%T%\curl e software\curl.zip
move /Y %T%\curl\curl.exe %TOOLS%
move /Y %T%\curl\libcurl*.dll %TOOLS%
move /Y %T%\curl\curl-ca-bundle.crt %TOOLS%
rd /S /Q %T%\curl

```


## 2.3 Install GIT

[GIT for windows website](https://git-scm.com)

Download with curl to software folder:
```dos
%TOOLS%\curl -L https://github.com/git-for-windows/git/releases/download/v2.30.1.windows.1/Git-2.30.1-64-bit.exe --output software\git-setup.exe

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
software\git-setup.exe /LOADINF=c:\temp\install-git.txt /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS
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

# 4. Get/Install essential building tools and software

## 4.1 Microsoft Media Creation Tool

The media creation tool is needed to create a bootable USB stick or you can download a Windows 10 ISO file with it. You can download it with the script "download-software.cmd". Or you can download it yourself: https://www.microsoft.com/en-us/software-download/windows10

Save it in folder "software" as "MediaCreationTool20H2"


## 4.2 Manual download of ISO file

At the moment I don't know of any method to automate this. So start the media creation tool and download the Windows 10 ISO file or get it from somewhere else.

Save the ISO file to folder "iso".

**IMPORTANT HINT:** Download the ISO file with this tool and KEEP this copy on your local disk *and* in your BACKUP! As history shows Microsoft *removes* access to old Windows versions for some time now.


## 4.3 Windows ADK

The Windows ADK contains the Windows Image Manager and some other essential tools.

You can download it with the script "download-software.cmd". Afterwards execute "install-adk.cmd" and it will be setup automatically. Or you can download it yourself: https://docs.microsoft.com/en-US/windows-hardware/get-started/adk-install

Save it in folder "software" and install with:
```dos
adksetup.exe /q /ceip off /norestart /features OptionId.DeploymentTools

```

