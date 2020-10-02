<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-10-01 9:24 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$FileFolder = "J:\QBitPortableExports\"
$FileName = "TorrentList-08_23_20-18_34_50"
$FileExt = "xml"
$LimitSize = 6MB
$FilePath = $FileFolder + $FileName + '.' + $FileExt
$ReadFile = [io.file]::OpenRead($FilePath)
$Size = new-object byte[] $LimitSize

$RemainingData = 0
$ID = 0
Do
{
	$RemainingData = $ReadFile.Read($Size, 0, $Size.Length)
	If ($RemainingData -gt 0)
	{
		$NewChunk = $FileFolder + $FileName + "-$ID-" + '.' + $FileExt
		$ChunkFile = [io.file]::OpenWrite($NewChunk)
		$ChunkFile.Write($Size, 0, $RemainingData)
		$ChunkFile.Close()
	}
	$ID++
}
While ($RemainingData -gt 0)

$ReadFile.Close()
