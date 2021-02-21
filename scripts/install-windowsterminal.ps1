# Install Windows Terminal ...

#$MSIBUNDLE="..\software\Microsoft.WindowsTerminal_1.5.10271.0_8wekyb3d8bbwe.msixbundle"
$MSIBUNDLE="..\software\windowsterminal-setup.msixbundle"

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = "SilentlyContinue"
# $progressPreference = 'SilentlyContinue'

Add-AppXPackage -path "$MSIBUNDLE"

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

