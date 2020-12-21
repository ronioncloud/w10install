set MNT="c:\TEMP\WIM"

rem GROUP 1:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Internet" /r
install_wim_tweak.exe /p %MNT% /c "Adobe-Flash" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Cortana" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Search2" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SearchEngine" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RetailDemo" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ContactSupport" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-PPIProjection" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Backup" /r
install_wim_tweak.exe /p %MNT% /c "Windows-Defender" /r

rem GROUP 2:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Xbox" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TroubleShooting" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-TroubleShooting" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-LanguageFeatures" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Legacy" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-SpeechComponents" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Gaming" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Indexer" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BioEnrollment" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Biometrics" /r

rem GROUP 3:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-XPSServices" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Xps" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Geolocation" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Compression" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BusinessScanning" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayer" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-VirtualPC" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-VirtualXP" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SystemRestore" /r

rem GROUP 4:
install_wim_tweak.exe /p %MNT% /c "Server-Help" /r
install_wim_tweak.exe /p %MNT% /c "Sensors-Universal" /r
install_wim_tweak.exe /p %MNT% /c "MultiPoint-Help" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordBreaking" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WorkplaceJoin" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinSATMediaFiles" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinOcr" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WebcamExperience" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Virtualization" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TextPrediction" /r

rem GROUP 5:
install_wim_tweak.exe /p %MNT% /c "HyperV" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Hyper" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-HyperV" /r
install_wim_tweak.exe /p %MNT% /c "Media-FaceAnalysis" /r
install_wim_tweak.exe /p %MNT% /c "Media-Ocr" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Mobile" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-AllJoyn" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-AllowTelemetry" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-BITS" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-CameraCaptureUI" /r

rem GROUP 6:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Connectivity-NFC" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Connectivity-Serial" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-DebugCore" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-InkPlatform" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Maps" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Miracast" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-CastingCommon" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-CastingReceiver" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-CastingTransmitter" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-NowPlayingSessionManager" /r

rem GROUP 7:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-RemoteDesktopServices" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Sensors" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Tethering" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-UserDataAccess" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Wallet" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-WebService" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-3DAudio" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-AppCompat" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-BITS" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Browser" /r

rem GROUP 8:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Casting" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-CoreSystem-DebugTransports" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Help" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMIPerf" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-IIS-WebServer" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Killbits" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Lxss" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Media-Streaming" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MiracastView" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobilePC" /r

rem GROUP 9:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Shell-HomeGroup" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Network-Connectivity-Assistant" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-QuickAssist" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteAssistance" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteFX" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RemoteDesktop" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TabletPC" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SNMP" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Skype" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Shell-SettingSync" /r

rem GROUP 10:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-ApplicationModel-Sync" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceSync" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-EnterpriseClientSync" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ShareMedia" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Telnet" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Serial" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SenseClient" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RDC" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Proximity" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Printing-PrintToPDFServices" /r

rem GROUP 11:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PerformanceCounters" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PeerToPeer" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ParentalControls" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OneDrive" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-OfflineFiles" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NFS" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetworkDiagnostics" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Network-QoS" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MRT10" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobileBroadband" /r

rem GROUP 12:
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-EnergyEstimationEngine" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Networking-MobileBroadbandApi" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-PointOfService" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ContentDeliveryManager" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DataCenterBridging" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Links" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Migration" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MobileCore" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PeerDist" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SnippingTool" /r

rem GROUP 13:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Store" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Common-Modem" /r
install_wim_tweak.exe /p %MNT% /c "DeviceAccess" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-ESENT" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-InternetExplorer" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-OneCore-Multimedia-MFPMP" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DirectoryServices-ADAM" /r
install_wim_tweak.exe /p %MNT% /c "microsoft-windows-directoryservices-adam" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WinRT" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-International" /r

rem GROUP 14:
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TerminalServices" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-TS" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Provisioning" /r
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-LanguageEnablingComponents" /r

rem CLEANUP:
del SOFTWAREBKP 1>nul 2>nul

