set MNT=c:\TEMP\WIM

rem Critical ? :
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Media-Format" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NewTabPageHost" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FCI-Client" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HVSI" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FodMetadata" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Foundation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ConfigCI" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SecureStartup" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Product-Data-EKB" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Identity-Foundation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Desktop-BCDTemplate" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Client-License-Platform" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Holographic-Desktop" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RegulatedPackages" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Professional-SPP-Components" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMPNetworkSharingService" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceGuard-GPEXT" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Embedded-UnifiedWriteFilterCSP" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayback-OC" /r /n

rem cannot remove ? :
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer-Troubleshooters" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMPNetworkSharingService" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad-FoD" /r /n

rem CLEANUP:
del SOFTWAREBKP 1>nul 2>nul

rem export remaining PACKAGE names ...
install_wim_tweak /p %MNT% /l
dir Packages.txt

