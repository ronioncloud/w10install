set MNT=c:\TEMP\WIM

install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FodMetadata" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Identity-Foundation" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WordPad-FoD" /r /n
install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Notepad-FoD" /r /n

rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Client-License-Platform" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-20H2Enablement" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-Desktop-Required" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Client-LanguagePack" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Common-Foundation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Common-RegulatedPackages" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ConfigCI-Package" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ConfigCI-Onecore" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Desktop-BCDTemplate" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DesktopFileExplorer" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-DeviceGuard-GPEXT" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-EditionPack-Professional" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Editions-Professional" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-EditionSpecific-Professional" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Embedded-UnifiedWriteFilterCSP" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Enterprise-Desktop-Share" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-FCI-Client" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Foundation" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-GroupPolicy-ClientExtensions" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-GroupPolicy-ClientTools" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Holographic-Desktop" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-HVSI" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-MSPaint-FoD" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetFx" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetFx2" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetFx3" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NetFx4" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-NewTabPageHost" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-PowerShell-ISE-FOD" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Product-Data-EKB" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Product-Data-EKB" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Professional-SPP-Components" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ProfessionalEdition" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-RegulatedPackages" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Required-ShellExperiences-Desktop" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Runtime-Metadata-Desktop" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SecureStartup" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-SecureStartup-Subsystem" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-Education-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-Enterprise" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-IoTEnterprise-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-Professional-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-ProfessionalCountrySpecific-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-ProfessionalEducation-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-ProfessionalSingleLanguage-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-ProfessionalWorkstation-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-Security-SPP-Component-SKU-ServerRdsh-License" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-ShellExperienceHost" /r /n
rem install_wim_tweak.exe /p %MNT% /c "Microsoft-Windows-WMPNetworkSharingService" /r /n

rem CLEANUP:
del SOFTWAREBKP 1>nul 2>nul

rem export remaining PACKAGE names ...
install_wim_tweak /p %MNT% /l
dir Packages.txt

