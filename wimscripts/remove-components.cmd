set MNT=c:\TEMP\WIM

rem GROUP 1:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Internet" /r /n
install_wim_tweak.exe /p %MNT% /c "Adobe-Flash" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Cortana" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Search2" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SearchEngine" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RetailDemo" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ContactSupport" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-PPIProjection" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Backup" /r /n
install_wim_tweak.exe /p %MNT% /c "Windows-Defender" /r /n

rem GROUP 2:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Xbox" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TroubleShooting" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-TroubleShooting" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-LanguageFeatures" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Legacy" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-SpeechComponents" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Gaming" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Indexer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BioEnrollment" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Biometrics" /r /n

rem GROUP 3:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-XPSServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Xps" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Geolocation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Compression" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BusinessScanning" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-VirtualPC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-VirtualXP" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SystemRestore" /r /n

rem GROUP 4:
install_wim_tweak.exe /p %MNT% /c "Server-Help" /r /n
install_wim_tweak.exe /p %MNT% /c "Sensors-Universal" /r /n
install_wim_tweak.exe /p %MNT% /c "MultiPoint-Help" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordBreaking" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WorkplaceJoin" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinSATMediaFiles" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinOcr" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WebcamExperience" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Virtualization" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TextPrediction" /r /n

rem GROUP 5:
install_wim_tweak.exe /p %MNT% /c "HyperV" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Hyper" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-HyperV" /r /n
install_wim_tweak.exe /p %MNT% /c "Media-FaceAnalysis" /r /n
install_wim_tweak.exe /p %MNT% /c "Media-Ocr" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Mobile" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-AllJoyn" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-AllowTelemetry" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-BITS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-CameraCaptureUI" /r /n

rem GROUP 6:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Connectivity-NFC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Connectivity-Serial" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-DebugCore" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-InkPlatform" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Maps" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Miracast" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-CastingCommon" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-CastingReceiver" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-CastingTransmitter" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-NowPlayingSessionManager" /r /n

rem GROUP 7:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-RemoteDesktopServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Sensors" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Tethering" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-UserDataAccess" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Wallet" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-WebService" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-3DAudio" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-AppCompat" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BITS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Browser" /r /n

rem GROUP 8:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Casting" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-CoreSystem-DebugTransports" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Help" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMIPerf" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-IIS-WebServer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Killbits" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Lxss" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Media-Streaming" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MiracastView" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobilePC" /r /n

rem GROUP 9:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Shell-HomeGroup" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Network-Connectivity-Assistant" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-QuickAssist" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteAssistance" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteFX" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteDesktop" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TabletPC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SNMP" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Skype" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Shell-SettingSync" /r /n

rem GROUP 10:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-ApplicationModel-Sync" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceSync" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-EnterpriseClientSync" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ShareMedia" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Telnet" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Serial" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SenseClient" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RDC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Proximity" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PrintToPDFServices" /r /n

rem GROUP 11:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PerformanceCounters" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PeerToPeer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ParentalControls" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OneDrive" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OfflineFiles" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NFS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetworkDiagnostics" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Network-QoS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MRT10" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobileBroadband" /r /n

rem GROUP 12:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-EnergyEstimationEngine" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Networking-MobileBroadbandApi" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-PointOfService" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ContentDeliveryManager" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DataCenterBridging" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Links" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Migration" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobileCore" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PeerDist" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SnippingTool" /r /n

rem GROUP 13:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Store" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Common-Modem" /r /n
install_wim_tweak.exe /p %MNT% /c "DeviceAccess" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-ESENT" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-InternetExplorer" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-MFPMP" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DirectoryServices-ADAM" /r /n
install_wim_tweak.exe /p %MNT% /c "microsoft-windows-directoryservices-adam" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinRT" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-International" /r /n

rem GROUP 14:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TerminalServices" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TS" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Provisioning" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-LanguageEnablingComponents" /r /n

rem CLEANUP:
del SOFTWAREBKP 1>nul 2>nul

