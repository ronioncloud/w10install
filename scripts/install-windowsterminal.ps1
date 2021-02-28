# Install Windows Terminal ...

cd ..\software
$MSIBUNDLE="windowsterminal-setup.msixbundle"
if (! (Test-Path $MSIBUNDLE)) {
  write-host "ERROR: $MSIBUNDLE not found!"
  exit 1
}

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = "SilentlyContinue"
Add-AppXPackage -path "$MSIBUNDLE"
DISM.EXE /Online /Add-ProvisionedAppxPackage /PackagePath:$MSIBUNDLE /SkipLicense
cd ..\scripts

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'
