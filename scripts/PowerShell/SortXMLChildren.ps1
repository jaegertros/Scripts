<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-10-01 9:32 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

<#
.SYNOPSIS Sorts an xml file by element and attribute names. Useful for diffing XML files.
#>

<#
.SYNOPSIS Sorts an xml file by element and attribute names. Useful for diffing XML files.
#>

param (
	[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
	# The path to the XML file to be sorted
	[string]$XmlPath
)

process
{
	if (-not (Test-Path $XmlPath))
	{
		Write-Warning "Skipping $XmlPath, as it was not found."
		continue;
	}
	
	$fullXmlPath = (Resolve-Path $XmlPath)
	[xml]$xml = Get-Content $fullXmlPath
	Write-Output "Sorting $fullXmlPath"
	
	function SortChildNodes($node, $depth = 0, $maxDepth = 20)
	{
		if ($node.HasChildNodes -and $depth -lt $maxDepth)
		{
			foreach ($child in $node.ChildNodes)
			{
				SortChildNodes $child ($depth + 1) $maxDepth
			}
		}
		
		$sortedAttributes = $node.Attributes | Sort-Object { $_.Name }
		$sortedChildren = $node.ChildNodes | Sort-Object { $_.OuterXml }
		
		$node.RemoveAll()
		
		foreach ($sortedAttribute in $sortedAttributes)
		{
			[void]$node.Attributes.Append($sortedAttribute)
		}
		
		foreach ($sortedChild in $sortedChildren)
		{
			[void]$node.AppendChild($sortedChild)
		}
	}
	
	SortChildNodes $xml.DocumentElement
	
	#$xml.Save($fullXmlPath)
	$xml.Save("J:\QBitPortableExports\TorrentList_sorted.xml")
}

