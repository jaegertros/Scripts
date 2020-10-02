<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-10-01 9:43 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$xmlPath = "J:\QBitPortableExports\TorrentList-08_23_20-18_34_50.xml"
$xmlPathSorted = "J:\QBitPortableExports\TorrentList_sorted.xml"
[xml]$myXml = Get-Content -Encoding UTF8 $xmlPath

#$myXml | Sort-Object { $_.torrentlist.torrent.name }

# Get the items collection
$items = $myXml.torrentlist.torrent
# Sort the items and store in $orderedItems
$orderedItems = $items.torrent | Sort name
# Removed existing items from xml variable
$items.RemoveAll()
# Append sorted items
$orderedItems | foreach { $items.AppendChild($_) }

$myXml.Save($xmlPathSorted)