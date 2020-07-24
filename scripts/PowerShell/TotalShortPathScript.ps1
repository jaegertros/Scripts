<#

New-Item 0.txt -type file | Out-Null #Creates 0.txt

$path = (dir 0.txt).FullName #Returns full path name of file

$object = New-Object -ComObject Scripting.FileSystemObject
$output = $object.GetFile($path)
$output.shortpath.trim("0.txt") | Out-Null #Generates 8.3 short file path output

Write-Host "`n`n The short path of this directory is" $output.shortpath.trim("0.txt") #Writes output

Remove-Item 0.txt #Deletes 0.txt

#>

$LongPath = Read-Host -Prompt 'Please input the full path for which you want the DOS 8.3 short path:'

$object = New-Object -ComObject Scripting.FileSystemObject
$output = $object.GetFolder($LongPath)
$output.shortpath | Out-Null #Generates 8.3 short file path output

Write-Host "`n`n The short path of this directory is" $output.shortpath #Writes output


Pause