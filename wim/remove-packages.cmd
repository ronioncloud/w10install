@echo off
set MNT=c:\TEMP\WIM
set CHECKFILE=%MNT%\Windows\SysWOW64\mf.dll

echo exporting PACKAGE list BEFORE doing any changes ...
install_wim_tweak /p %MNT% /l
move /Y Packages.txt Packages-BEFORE.txt

rem ###################################
rem MAIN loop ( remove packages ) ...
rem ###################################

for %%P in (

  Adobe-Flash
  Containers-ApplicationGuard
  Containers-Client
  Containers-DisposableClientVM
  Containers-Guest-Gated
  Containers-OptionalFeature
  Containers-Server
  DeviceAccess
  HyperV
  LanguageFeatures-WordBreaking
  Media-FaceAnalysis
  Media-Ocr
  Microsoft-Composable-PlatformExtension
  Microsoft-Hyper-V
  Microsoft-IoTUAP-ShellExt-Tools
  Microsoft-Mobile
  Microsoft-PPIProjection
  Microsoft-UtilityVM
  Microsoft-Windows-3DAudio
  Microsoft-Windows-ApiSetSchemaExtension-HyperV
  Microsoft-Windows-AppCompat
  Microsoft-Windows-AppManagement
  Microsoft-Windows-AppServerClient
  Microsoft-Windows-Backup
  Microsoft-Windows-Basic-Http-Minio
  Microsoft-Windows-BioEnrollment
  Microsoft-Windows-BITS
  Microsoft-Windows-Branding-Enterprise
  Microsoft-Windows-Browser
  Microsoft-Windows-BusinessScanning
  Microsoft-Windows-Casting
  Microsoft-Windows-Client-AssignedAccess
  Microsoft-Windows-Client-EmbeddedExp
  Microsoft-Windows-Client-Optional-Features
  Microsoft-Windows-Client-ShellLauncher
  Microsoft-Windows-Common-Modem
  Microsoft-Windows-COM-MSMQ
  Microsoft-Windows-Compression
  Microsoft-Windows-ContactSupport
  Microsoft-Windows-ContentDeliveryManager
  Microsoft-Windows-CoreSystem-DebugTransports
  Microsoft-Windows-Cortana
  Microsoft-Windows-DataCenterBridging
  Microsoft-Windows-DeviceSync
  Microsoft-Windows-DirectoryServices
  Microsoft-Windows-EnterpriseClientSync
  Microsoft-Windows-FodMetadata
  Microsoft-Windows-Geolocation
  Microsoft-Windows-Hello-Face
  Microsoft-Windows-Help
  Microsoft-Windows-HVSI-Components
  Microsoft-Windows-HyperV-OptionalFeature-HypervisorPlatform
  Microsoft-Windows-HyperV-OptionalFeature-VirtualMachinePlatform
  Microsoft-Windows-Identity-Foundation
  Microsoft-Windows-IIS-WebServer
  Microsoft-Windows-International
  Microsoft-Windows-InternetExplorer
  Microsoft-Windows-Internet
  Microsoft-Windows-Killbits
  Microsoft-Windows-LanguageEnablingComponents
  Microsoft-Windows-LanguageFeatures
  Microsoft-Windows-Legacy
  Microsoft-Windows-Links
  Microsoft-Windows-Lxss
  Microsoft-Windows-Management-SecureAssessment
  Microsoft-Windows-Migration
  Microsoft-Windows-MiracastView
  Microsoft-Windows-MobileBroadband
  Microsoft-Windows-MobileCore
  Microsoft-Windows-MobilePC
  Microsoft-Windows-MRT10
  Microsoft-Windows-MSMQ
  Microsoft-Windows-MultiPoint-Connector
  Microsoft-Windows-Network-Connectivity-Assistant
  Microsoft-Windows-NetworkDiagnostics
  Microsoft-Windows-Network-QoS
  Microsoft-Windows-NFS
  Microsoft-Windows-Not-Supported-On-LTSB
  Microsoft-Windows-OfflineFiles
  Microsoft-Windows-OneCore-Containers
  Microsoft-Windows-OneDrive
  Microsoft-Windows-ParentalControls
  Microsoft-Windows-PAW-Feature
  Microsoft-Windows-PeerDist
  Microsoft-Windows-PeerToPeer
  Microsoft-Windows-PerformanceCounters
  Microsoft-Windows-PhotoBasic
  Microsoft-Windows-Portable-Devices
  Microsoft-Windows-Printing-InternetPrinting-Client
  Microsoft-Windows-Printing-LocalPrinting-Enterprise
  Microsoft-Windows-Printing-PremiumTools
  Microsoft-Windows-Printing-PrintToPDFServices
  microsoft-windows-printing-wfs-fod-package-Wrapper
  Microsoft-Windows-Printing-WFS-FoD-Package
  Microsoft-Windows-Printing-XPSServices
  Microsoft-Windows-Provisioning
  Microsoft-Windows-Proximity
  Microsoft-Windows-QuickAssist
  Microsoft-Windows-RDC
  Microsoft-Windows-RemoteAssistance
  Microsoft-Windows-RemoteDesktop
  Microsoft-Windows-RemoteFX
  Microsoft-Windows-RetailDemo
  Microsoft-Windows-Search2
  Microsoft-Windows-SearchEngine
  Microsoft-Windows-SenseClient
  Microsoft-Windows-Serial
  Microsoft-Windows-ShareMedia
  Microsoft-Windows-Shell-HomeGroup
  Microsoft-Windows-Shell-SettingSync
  Microsoft-Windows-Skype
  Microsoft-Windows-SMB1Client-D
  Microsoft-Windows-SMB1Deprecation-Group
  Microsoft-Windows-SMB1
  Microsoft-Windows-SMB1Server-D-Opt
  Microsoft-Windows-SmbDirect-Opt
  Microsoft-Windows-SmbDirect
  Microsoft-Windows-SnippingTool
  Microsoft-Windows-SNMP
  Microsoft-Windows-StorageService
  Microsoft-Windows-Store
  Microsoft-Windows-SystemRestore
  Microsoft-Windows-TabletPC
  Microsoft-Windows-TabletPCMath
  microsoft-windows-tabletpcmath-package-Wrapper
  Microsoft-Windows-TabShellExperience
  Microsoft-Windows-Telnet-Client
  Microsoft-Windows-Telnet
  Microsoft-Windows-TerminalServices
  Microsoft-Windows-TextPrediction-Dictionaries
  Microsoft-Windows-TextPrediction
  Microsoft-Windows-TFTP-Client
  Microsoft-Windows-TroubleShooting
  Microsoft-Windows-TS
  Microsoft-Windows-UpdateTargeting-ClientOS
  Microsoft-Windows-UserExperience
  microsoft-windows-userexperience-desktop-package-Wrapper
  Microsoft-Windows-Virtualization-RemoteFX-User-Mode-Transport
  Microsoft-Windows-Virtualization
  Microsoft-Windows-VirtualPC
  Microsoft-Windows-VirtualXP
  Microsoft-Windows-WebcamExperience
  Microsoft-Windows-WindowsFoundation-LanguagePack
  Microsoft-Windows-WinOcr
  Microsoft-Windows-WinRT
  Microsoft-Windows-WinSATMediaFiles
  Microsoft-Windows-WMIPerf
  Microsoft-Windows-WordBreaking
  Microsoft-Windows-WorkplaceJoin
  Microsoft-Windows-WPD-LegacyWmdmFeature
  Microsoft-Windows-WPD-UltimatePortableDeviceFeature-Feature
  Microsoft-Windows-Xps
  Microsoft-Xbox
  MSMQ-Driver-Package
  MultiPoint
  Networking-MPSSVC-Rules-EnterpriseEdition-Package
  OpenSSH-Client-Package
  openssh-client-package-Wrapper
  RemoteDesktopServices
  Sensors-Universal
  Server-Help
  Windows-Defender
  WindowsSearchEngineSKU-Group
  microsoft-onecore-applicationmodel
  Microsoft-OneCore-ApplicationModel
  Microsoft-OneCore-IsolatedUserMode
  Microsoft-OneCore-Multimedia-CastingCommon
  Microsoft-OneCore-Multimedia-CastingReceiver
  Microsoft-OneCore-VirtualizationBasedSecurity
  Microsoft-OneCoreUAP-AppRuntime
  Microsoft-OneCore-Multimedia-CastingTransmitter-Media-Package
  Microsoft-Onecore-SPP-VirtualDevice

) do (
  
  @echo on
  install_wim_tweak.exe /p %MNT% /c "%%P" /r /n
  @echo off 

  if NOT EXIST %CHECKFILE% (
    echo ERROR: File %CHECKFILE% was deleted
    exit /b
  )

)

echo CLEANUP ...
del /F SOFTWAREBKP 1>nul 2>nul

echo exporting remaining PACKAGES list ...
install_wim_tweak /p %MNT% /l
move /Y Packages.txt Packages-AFTER.txt

rem showing packages ...
dir Packages*.txt

