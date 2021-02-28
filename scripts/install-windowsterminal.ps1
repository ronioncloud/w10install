# Install Windows Terminal ...

$MSIBUNDLE="..\software\windowsterminal-setup.msixbundle"
if (! (Test-Path $MSIBUNDLE)) {
  write-host "ERROR: $MSIBUNDLE not found!"
  exit 1
}

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = "SilentlyContinue"
Add-AppXPackage -allusers -path "$MSIBUNDLE"

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'
