set MNT=c:\TEMP\WIM

echo exporting PACKAGE list BEFORE doing any changes ...
install_wim_tweak /p %MNT% /l
move /Y Packages.txt Packages-BEFORE.txt

install_wim_tweak.exe /p %MNT% /c "Adobe-Flash" /r /n
install_wim_tweak.exe /p %MNT% /c "Containers-ApplicationGuard" /r /n
install_wim_tweak.exe /p %MNT% /c "Containers-Client" /r /n
install_wim_tweak.exe /p %MNT% /c "Containers-DisposableClientVM" /r /n
install_wim_tweak.exe /p %MNT% /c "Containers-Guest-Gated" /r /n
install_wim_tweak.exe /p %MNT% /c "Containers-OptionalFeature" /r /n
install_wim_tweak.exe /p %MNT% /c "Containers-Server" /r /n
install_wim_tweak.exe /p %MNT% /c "DeviceAccess" /r /n
install_wim_tweak.exe /p %MNT% /c "HyperV" /r /n
install_wim_tweak.exe /p %MNT% /c "LanguageFeatures-WordBreaking" /r /n
install_wim_tweak.exe /p %MNT% /c "Media-FaceAnalysis" /r /n
install_wim_tweak.exe /p %MNT% /c "Media-Ocr" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Composable-PlatformExtension" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Hyper-V" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-IoTUAP-ShellExt-Tools" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Media-Foundation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Mobile" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore" /r /n
install_wim_tweak.exe /p %MNT% /c "microsoft-onecore-applicationmodel-sync-desktop-fod-package-Wrapper" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Onecore-SPP-VirtualDevice-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-PPIProjection" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-UtilityVM" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-3DAudio" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ApiSetSchemaExtension-HyperV" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-AppCompat" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-AppManagement" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-AppServerClient" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Backup" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Basic-Http-Minio" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BioEnrollment" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BITS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Branding-Enterprise" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Browser" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BusinessScanning" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Casting" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-AssignedAccess" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-EmbeddedExp" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-Optional-Features" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-ShellLauncher" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Common-Modem" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-COM-MSMQ" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Compression" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ContactSupport" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ContentDeliveryManager" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-CoreSystem-DebugTransports" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Cortana" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DataCenterBridging" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceSync" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DirectoryServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-EnterpriseClientSync" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FodMetadata" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Geolocation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Hello-Face" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Help" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HVSI-Components" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HyperV-OptionalFeature-HypervisorPlatform" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HyperV-OptionalFeature-VirtualMachinePlatform" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Identity-Foundation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-IIS-WebServer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-International" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-InternetExplorer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Internet" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Killbits" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-LanguageEnablingComponents" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-LanguageFeatures" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Legacy" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Links" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Lxss" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Management-SecureAssessment" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Media-Format" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayback-OC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayer" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Media-Streaming" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Migration" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MiracastView" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobileBroadband" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobileCore" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobilePC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MRT10" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MSMQ" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MultiPoint-Connector" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Network-Connectivity-Assistant" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetworkDiagnostics" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Network-QoS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NFS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Not-Supported-On-LTSB" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OfflineFiles" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OneCore-Containers" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OneDrive" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ParentalControls" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PAW-Feature" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PeerDist" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PeerToPeer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PerformanceCounters" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PhotoBasic" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Portable-Devices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Presentation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-InternetPrinting-Client" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-LocalPrinting-Enterprise" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PMCPPC-FoD-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PremiumTools" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PrintToPDFServices" /r /n
install_wim_tweak.exe /p %MNT% /c "microsoft-windows-printing-wfs-fod-package-Wrapper" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-WFS-FoD-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-XPSServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Provisioning" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Proximity" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-QuickAssist" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RDC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteAssistance" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteDesktop" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteFX" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RetailDemo" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Search2" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SearchEngine" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SenseClient" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Serial" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ShareMedia" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Shell-HomeGroup" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Shell-SettingSync" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Skype" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1Client-D" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1Deprecation-Group" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SMB1Server-D-Opt" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SmbDirect-Opt" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SmbDirect" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SnippingTool" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SNMP" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-StepsRecorder-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-StorageService" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Store" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SystemRestore" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TabletPC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TabletPCMath" /r /n
install_wim_tweak.exe /p %MNT% /c "microsoft-windows-tabletpcmath-package-Wrapper" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TabShellExperience" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Telnet-Client" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Telnet" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TerminalServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TextPrediction-Dictionaries" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TextPrediction" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TFTP-Client" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TroubleShooting" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-UpdateTargeting-ClientOS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-UserExperience" /r /n
install_wim_tweak.exe /p %MNT% /c "microsoft-windows-userexperience-desktop-package-Wrapper" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Virtualization-RemoteFX-User-Mode-Transport" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Virtualization" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-VirtualPC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-VirtualXP" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WebcamExperience" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsFoundation-LanguagePack" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer-Troubleshooters-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinOcr" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinRT" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinSATMediaFiles" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMIPerf" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordBreaking" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad-FoD" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WorkplaceJoin" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WPD-LegacyWmdmFeature" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WPD-UltimatePortableDeviceFeature-Feature" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Xps" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Xbox" /r /n
install_wim_tweak.exe /p %MNT% /c "MSMQ-Driver-Package" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Multimedia-MFCore" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Multimedia-RestrictedCodecsCore" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Multimedia-RestrictedCodecsDolby" /r /n
install_wim_tweak.exe /p %MNT% /c "MultiPoint" /r /n
install_wim_tweak.exe /p %MNT% /c "Networking-MPSSVC-Rules-EnterpriseEdition-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "OpenSSH-Client-Package" /r /n
install_wim_tweak.exe /p %MNT% /c "openssh-client-package-Wrapper" /r /n
install_wim_tweak.exe /p %MNT% /c "RemoteDesktopServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Sensors-Universal" /r /n
install_wim_tweak.exe /p %MNT% /c "Server-Help" /r /n
install_wim_tweak.exe /p %MNT% /c "Windows-Defender" /r /n
install_wim_tweak.exe /p %MNT% /c "WindowsSearchEngineSKU-Group" /r /n

echo CLEANUP ...
del /F SOFTWAREBKP 1>nul 2>nul

echo exporting remaining PACKAGE names AFTER removing packages ...
install_wim_tweak /p %MNT% /l
move /Y Packages.txt Packages-AFTER.txt

rem showing packages ...
dir Packages*.txt

