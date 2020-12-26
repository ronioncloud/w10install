set MNT=c:\TEMP\WIM

install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-EmbeddedExp" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-Optional-Features" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-ShellLauncher" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Management-SecureAssessment" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MultiPoint-Connector" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Not-Supported-On-LTSB" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OneCore-Containers" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PAW-Feature" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Portable-Devices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-WFS-FoD" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PremiumTools" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PMCPPC-FoD" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-InternetPrinting-Client" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-LocalPrinting-Enterprise" /r /n

rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Product-Data-EKB" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Professional-SPP-Components" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SecureStartup" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceGuard-GPEXT" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Embedded-UnifiedWriteFilterCSP" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FCI-Client" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FodMetadata" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Foundation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Hello-Face" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HVSI" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayback-OC" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NewTabPageHost" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RegulatedPackages" /r /n

rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SmbDirect" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer-Troubleshooters" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMPNetworkSharingService" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer-Troubleshooters" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1Client-D" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1Deprecation-Group" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1Server-D-Opt" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SmbDirect-Opt" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMPNetworkSharingService" /r /n

rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Onecore-SPP-VirtualDevice" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ConfigCI" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Holographic-Desktop" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HVSI-Components" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HyperV-OptionalFeature-HypervisorPlatform" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HyperV-OptionalFeature-VirtualMachinePlatform" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Multimedia-RestrictedCodecsDolby" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Media-Format" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MSMQ-Client" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MSMQ-MMC-OptGroup" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PhotoBasic" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Presentation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad-FoD" /r /n

rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Identity-Foundation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Client-License-Platform" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Desktop-BCDTemplate" /r /n

rem CLEANUP:
del SOFTWAREBKP 1>nul 2>nul

rem export remaining PACKAGE names ...
install_wim_tweak /p %MNT% /l
dir Packages.txt

