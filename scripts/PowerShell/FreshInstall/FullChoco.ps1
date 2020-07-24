  
# Now, create the $profile directory if it doesn’t exist
if ( ! (Test-path $profile)) {
	Write-Host "You do not have a PowerShell Profile......Gay" -ForegroundColor Red -BackgroundColor DarkGray
	Write-Host "Creating one now..." -ForegroundColor DarkYellow -BackgroundColor DarkGray
	New-item –type file –force $profile
	Write-Host "Your PowerShell profile was created at $profile" -ForegroundColor Green -BackgroundColor DarkGray
} else {
Write-Host "You already have a PowerShell profile at $profile , you sly dog." -ForegroundColor Green -BackgroundColor DarkGray
}
  
Pause
 # Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))