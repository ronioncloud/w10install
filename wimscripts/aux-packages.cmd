set MNT=c:\TEMP\WIM

install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceGuard-GPEXT" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Embedded-UnifiedWriteFilterCSP" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FCI-Client" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FodMetadata" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Foundation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Hello-Face" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HVSI" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MediaPlayback-OC" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NewTabPageHost" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RegulatedPackages" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SmbDirect" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WindowsMediaPlayer-Troubleshooters" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMPNetworkSharingService" /r /n

rem CLEANUP:
del SOFTWAREBKP 1>nul 2>nul

rem export remaining PACKAGE names ...
install_wim_tweak /p %MNT% /l
dir Packages.txt

