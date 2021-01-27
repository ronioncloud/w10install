# Install Windows Terminal ...

$MSIBUNDLE="..\software\Microsoft.WindowsTerminal_1.4.3243.0_8wekyb3d8bbwe.msixbundle"

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = "SilentlyContinue"
# $progressPreference = 'SilentlyContinue'

Add-AppXPackage -path "$MSIBUNDLE"

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

