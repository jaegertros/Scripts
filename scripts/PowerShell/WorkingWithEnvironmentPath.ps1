Function Get-ShortName

{

 BEGIN { $fso = New-Object -ComObject Scripting.FileSystemObject }

 PROCESS {

  If ($_.psiscontainer)

   {$fso.getfolder($_.fullname).ShortName}

  ELSE {$fso.getfile($_.fullname).ShortName} } }

write-host "`n`n`n"
write-host "               Machine Path Environment Variable"
$MachinePathVar = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$MachinePathVar.split(";") | Sort Name


write-host "`n`n`n"
write-host "               User Path Environment Variable"
$UserPathVar = [System.Environment]::GetEnvironmentVariable('PATH','User') | Get-ShortName
$UserPathVar.split(";") | Sort Name