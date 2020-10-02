<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-09-25 8:48 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
Start-Transcript -OutputDirectory "$PSScriptRoot" -NoClobber
$CSVLocation = Read-Host -Prompt 'Please input the full path and filename for the CSV'
$WebsiteFolder = Split-Path -parent $CSVLocation

$oldvids = Get-ChildItem *.mkv -Recurse
foreach ($oldvid in $oldvids)
{
	$newvid = [io.path]::ChangeExtension($oldvid.FullName, '.mp4')
	.\ffmpeg.exe -i $oldvid.FullName -y -vcodec copy -acodec ac3 $newvid
}

