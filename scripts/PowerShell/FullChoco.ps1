#requires -version 5
<#
.SYNOPSIS
  1. Set up PowerShell
        -create profile
        -allow user scripts to run
  2. Allow file names to be longer than 260 characters
  3. Install chocolatey
      Remove comment (#) for any packages you want installed

.DESCRIPTION
  <Brief description of script>
.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
.NOTES
  Version:        1.0
  Author:         Caleb Waddell
  Creation Date:  2020-07-24
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
. "C:\Scripts\Functions\Logging_Functions.ps1"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#-----------------------------------------------------------[Functions]------------------------------------------------------------

<#
Function <FunctionName>{
  Param()


#>

#-----------------------------------------------------------[Execution]------------------------------------------------------------

#Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion
#Script Execution goes here
#Log-Finish -LogPath $sLogFile





######Installs RSAT (Remote Server Administration Tools)#####################
##### (RSAT includes the GPMC and the Group Policy Powershell cmdlets) ######
##isn't necessary with direct registry editing below###############

<#
#Source folder
$SourceFolder = $PSScriptRoot

#Crete new Powershell object
$KBArrayList = New-Object -TypeName System.Collections.ArrayList 

#Mofify KB article list
$KBArrayList.AddRange(@("WindowsTH-RSAT_WS_1803-x64")) 

foreach ($KB in $KBArrayList) { 
    if (-not(Get-Hotfix -Id $KB)) { 
        Start-Process -FilePath "wusa.exe" -ArgumentList "$SourceFolder$KB.msu /quiet /norestart" -Wait } 
} 

#>

#############################################################################



#Make sure powershell is elevated with administrative privileges
#Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

  
# Now, create the $profile directory if it doesn't exist
if ( ! (Test-path $profile)) {
	Write-Host "You do not have a PowerShell Profile......Gay" -ForegroundColor Red -BackgroundColor DarkGray
	Write-Host "Creating one now..." -ForegroundColor DarkYellow -BackgroundColor DarkGray
	New-item -type file -force $profile
	Write-Host "Your PowerShell profile was created at $profile" -ForegroundColor Green -BackgroundColor DarkGray
} else {
Write-Host "You already have a PowerShell profile at $profile , you sly dog." -ForegroundColor Green -BackgroundColor DarkGray
}
  

##############################################################################

############Group Policy######################################################


#Get drives in the current session
Get-PSDrive

Set-Location -Path "HKLM:\System\CurrentControlSet\Control\FileSystem"


#If you’re a Windows developer, system administrator or seasoned user, there’s  good chance you’re fully aware
#of the 255-260 character limit of filesystem paths. However, in case you never heard about it, here’s a small recap of the issue:
#In the Windows API (with some exceptions discussed in the following paragraphs), the maximum length for a path is MAX_PATH, which is defined as 260 characters
#If you’re a standard user, chances are you won’t get bothered by this limitation: who needs these long paths anyway? However, if you happen to be a developer
#working with linux-native package managers such as NPM, you will be struck by that issue sooner or later. That’s because there are many popular script-based
#libraries which make an intensive use of folder-nesting


#GPEdit location:  Computer Configuration > Administrative Templates > System > FileSystem 
Set-ItemProperty "HKLM:\System\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1



####Allow you to run your own scripts without getting pissy#############################################

#GPEdit location:  Computer Configuration > Policies > Administrative Templates > Windows Components > Windows PowerShell 
Set-Location -Path "HKLM\Software\Policies\Microsoft\Windows\PowerShell"
Set-ItemProperty "HKLM\Software\Policies\Microsoft\Windows\PowerShell" -Name "ExecutionPolicy" -Value Unrestricted

#GPEdit location:  User Configuration > Policies > Administrative Templates > Windows Components > Windows PowerShell 
Set-Location -Path "HKCU\Software\Policies\Microsoft\Windows\PowerShell"
Set-ItemProperty "HKCU\Software\Policies\Microsoft\Windows\PowerShell" -Name "ExecutionPolicy" -Value Unrestricted

Write-Host -NoNewLine 'Press any key to continue to Chocolatey Install...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');


#################Install Chocolatey##############################################################################


#will throw an error about being unable to change execution policy if you set it to unrestricted with my previous section, but
#continues without an issue

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


Write-Host -NoNewLine 'Press any key to continue setting Chocolatey arguments...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

######Refresh Windows environment variables so Chocolatey commands work now in PowerShell and Command Prompt
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

#sets chocolatey to automatically upgrade packages using the same arguments you used during install
choco feature enable -n=useRememberedArgumentsForUpgrades
#sets chocolatey to install packages and upgrade without user input to confirm each install
choco feature enable -n=allowGlobalConfirmation

####################################################################################################



######Chocolatey Package Installations#############################################################
Write-Host -NoNewLine 'Press any key to install the packages that you removed comments from in the script...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');



#####Notepad++ - so much better than that shitty Windows notepad
#choco install notepadplusplus

#####Notepad++ Plugin Manager 1.4.12
#choco install npppluginmanager



######Sysinternals - dope set of tools for troubleshooting Windows
####https://docs.microsoft.com/en-us/sysinternals/

<# Remove both these if installing

#stops Window Defender messing with tools scanning system
Add-MpPreference -ExclusionPath “C:\tools\Sysinternals”
#installs
choco install sysinternals --params "/InstallDir:C:\tools\Sysinternals"
#adds Sysinternals to Windows path so commands can be called directly
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\tools\Sysinternals")

Remove both these if installing#>




######Nirlauncher - dope set of tools for troubleshooting Windows - and adds Sysinternals to menu to access all from one place!
####https://launcher.nirsoft.net/

<# Remove both these if installing

#stops Window Defender messing with tools scanning system
Add-MpPreference -ExclusionPath “C:\tools\NirLauncher”
#installs
choco install nirlauncher --params "'/Sysinternals'" --install-args="'/DIR=C:\tools\NirLauncher'"

Remove both these if installing#>


####7-Zip -  file archiver with a high compression ratio.
#choco install 7zip

#####FFmpeg - FFmpeg is the leading multimedia framework, able to decode, encode, transcode, mux, demux, stream, filter and play
####pretty much anything that humans and machines have created

#choco install ffmpeg


####VLC media player
#choco install vlc


###Git - for Windows offers a native set of tools that bring the full feature set of the Git SCM to Windows
#choco install git


#####WinRAR - A powerful archive manager
#choco install winrar


####Rufus-Create bootable USB drives from Windows and Linux images

#choco install rufus



#####Chrome
#choco install googlechrome


####Flash Player ActiveX
#choco install flashplayeractivex


###Flash Player Plugin
#choco install flashplayerplugin


#####Adobe Acrobat Reader DC
#choco install adobereader


####Java SE Runtime Environment
#choco install jre8


####Mozilla Firefox 78.0.2
#choco install firefox


#####Win32 OpenSSH (Universal Installer)
#choco install openssh



#####Windows Management Framework and PowerShell
#choco install powershell



#####Microsoft .NET Framework 4.8
#choco install dotnetfx




#choco install javaruntime

#choco install python

#choco install jdk8

#choco install curl

#choco install wget

#choco install treesizefree

#choco install atom

#choco install chromium

#choco install virtualbox

#choco install wireshark

#choco install youtube-dl

#choco install cmake

#choco install irfanview

#choco install autohotkey

#choco install ninja

#choco install windirstat

#choco install audacity

#choco install doublecmd

#choco install sharex

#choco install winmerge

#choco install microsoft-windows-terminal

#choco install fiddler

#choco install msys2

#choco install mingw

#choco install qbittorrent

#choco install imagemagick.app

#choco install steam

#choco install docker-desktop

#choco install cpu-z

#choco install github-desktop

#choco install patheditor
#choco install path-manager

#choco install path-copy-copy

#choco install linkshellextension

#choco install powershell-preview

#choco install powershellhere-elevated


