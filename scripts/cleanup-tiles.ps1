#
# this script loads a tile layout for the
# start menu with NO tiles at all!
# ( = deletes all tiles )
#

$LAYOUT='C:\Windows\StartLayout.xml'

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

echo "delete layout file if it already exists ..."
If(Test-Path $LAYOUT) {
  Remove-Item $LAYOUT
}

echo "create a blank layout file [ $LAYOUT ] ..."
echo "<LayoutModificationTemplate xmlns:defaultlayout=""http://schemas.microsoft.com/Start/2014/FullDefaultLayout"" xmlns:start=""http://schemas.microsoft.com/Start/2014/StartLayout"" Version=""1"" xmlns=""http://schemas.microsoft.com/Start/2014/LayoutModification"">" > $LAYOUT
echo "  <LayoutOptions StartTileGroupCellWidth=""6"" />" >> $LAYOUT
echo "  <DefaultLayoutOverride>" >> $LAYOUT
echo "    <StartLayoutCollection>" >> $LAYOUT
echo "      <defaultlayout:StartLayout GroupCellWidth=""6"" />" >> $LAYOUT
echo "    </StartLayoutCollection>" >> $LAYOUT
echo "  </DefaultLayoutOverride>" >> $LAYOUT
echo "</LayoutModificationTemplate>" >> $LAYOUT

$regAliases = @("HKLM", "HKCU")

# assign the start layout and force it to apply with
#   "LockedStartLayout" at both the machine and user level ...
echo "assign the start layout AND apply it ..."
foreach ($regAlias in $regAliases) {
  $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
  $keyPath = $basePath + "\Explorer"
  IF(!(Test-Path -Path $keyPath)) {
      New-Item -Path $basePath -Name "Explorer"
  }
  Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1
  Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value "$LAYOUT"
}

# restart Explorer, open the start menu (necessary to load the new layout),
#   and give it a few seconds to process ...
echo "restart explorer ..."
taskkill /F /IM explorer.exe
sleep 3
start explorer.exe
sleep 3
$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^{ESCAPE}')
sleep 3

# enable the ability to pin items again by disabling "LockedStartLayout" ...
foreach ($regAlias in $regAliases) {
  $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
  $keyPath = $basePath + "\Explorer"
  Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0
}

# restart Explorer and delete the layout file ...
echo "restart explorer ..."
taskkill /F /IM explorer.exe
sleep 3
Remove-Item $LAYOUT
start explorer.exe

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

