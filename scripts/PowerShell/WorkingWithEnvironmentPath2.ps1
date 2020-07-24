Function Get-ShortName

{

 BEGIN { $fso = New-Object -ComObject Scripting.FileSystemObject }

 PROCESS {

  If ($_.psiscontainer)

   {$fso.getfolder($_.fullname).ShortName}

  ELSE {$fso.getfile($_.fullname).ShortName} } }

<#
([System.Environment]::GetEnvironmentVariable('PATH','machine')).split(";") | Sort
#$MachinePathVar.split(";") | Sort | Get-ShortName

C:\Program Files (x86)\Common Files\Acronis\FileProtector\
C:\Program Files (x86)\Common Files\Acronis\FileProtector64\
C:\Program Files (x86)\Common Files\Acronis\SnapAPI\
C:\Program Files (x86)\Common Files\Acronis\VirtualFile\
C:\Program Files (x86)\Common Files\Acronis\VirtualFile64\
C:\Program Files (x86)\gnupg\bin
C:\Program Files (x86)\Gpg4win\..\GnuPG\bin
#>

$DumbPath = C:\Program Files (x86)\gnupg\bin

Get-ShortName &$DumbPath