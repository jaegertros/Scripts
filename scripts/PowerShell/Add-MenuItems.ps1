$RestoreRoot = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add(
   “Restore”,$null,$null)
$RestoreRoot.Submenus.Add(“RestoreALLDefaults”, 
 {$psISE.Options.RestoreDefaults()}, “Ctrl+Alt+R”)
$RestoreRoot.SubMenus.Add(“RestoreTokenColorDefaults”, 
 {$psISE.Options.RestoreDefaultTokenColors()}, “Ctrl+Alt+T”)

$GetOptions = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add(
   “GetOptions”,$null,$null)
$GetOptions.SubMenus.Add(“GetFonts”, { C:\fso\Get-PsISEfonts.ps1 } , $null)
$GetOptions.SubMenus.Add(“GetColors”, { C:\fso\Get-PsIseColorValues.ps1 } , $null)

$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add(
   “MyCustomISE”, { C:\fso\Set-PsISEcolorsAndFonts.ps1 },$null)

$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add(“ClearMenu”, 
   { $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Clear() }, $null)