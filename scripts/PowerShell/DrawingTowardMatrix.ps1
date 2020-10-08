<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-10-07 12:28 AM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


#Requires -Version 3
Param (
	[Parameter(position = 0, Mandatory = $false)]
	[ValidateScript({
			$_ -gt 0 -AND $_ -lt $Width
		})]
	$Start,
	[Parameter(position = 1, mandatory = $false)]
	$Width = 80,
	[Parameter(position = 2, mandatory = $false)]
	$Speed = 50,
	[ValidateRange(1, 100)]
	$SplitFrequency = 5,
	[ValidateRange(1, 100)]
	$Inertia = 50
)

Function DrawLine
{
	Param (
		[System.Collections.ArrayList]$Points
	)
	$sb = New-Object System.Text.StringBuilder (" " * ($Width + 2))
	$sb[0] = "|"
	$sb[$Width + 1] = "|"
	$Crash = @()
	foreach ($Point in $Points)
	{
		if ($sb[$Point.Location] -ne " ")
		{
			$sb[$Point.Location] = "*"
			$Crash += $Points | Where-Object { $_.Location -eq $Point.Location }
		}
		else
		{
			$sb[$Point.Location] = $Point.Symbol
		}
	}
	foreach ($Crashed in $Crash)
	{
		$Points.Remove($crashed) | Out-Null
	}
	Write-host $sb.ToString()
	if ($Points.Count -eq 0)
	{
		return $false
	}
	else
	{
		return $true
	}
}

Function MovePoints
{
	Param (
		[System.Collections.ArrayList]$Points
	)
	$NewPoints = New-Object System.Collections.ArrayList
	for ($i = 0; $i -lt $Points.Count; $i++)
	{
		$InertiaRoll = Get-Random -Minimum 0 -Maximum 101
		if ($InertiaRoll -gt $Inertia)
		{
			switch ($Points[$i].Symbol)
			{
				"|" {
					$Direction = Get-Random -Minimum 0 -Maximum 2
					switch ($Direction)
					{
						0 { $Symbol = "/"; $Diff = -1 }
						1 { $Symbol = "\"; $Diff = 1 }
					}
				}
				default { $Symbol = "|"; $Diff = 0 }
			}
		}
		else
		{
			$Symbol = $Points[$i].Symbol
			$Diff = switch ($Symbol)
			{
				"\" { 1 }
				"/" { -1 }
				"|" { 0 }
			}
		}
		$SplitRoll = Get-Random -Minimum 0 -Maximum 101
		if ($SplitRoll -lt $SplitFrequency)
		{
			switch ($Diff)
			{
				0 { $LowSymbol = "/"; $HighSymbol = "\"; $LowDiff = -1; $HighDiff = 1 }
				1 { $LowSymbol = "/"; $HighSymbol = "|"; $LowDiff = -1; $HighDiff = 0 }
				-1 { $LowSymbol = "|"; $HighSymbol = "\"; $LowDiff = 0; $HighDiff = 1 }
			}
			$NewDirection = Get-Random -Minimum 0 -Maximum 2
			switch ($NewDirection)
			{
				0 { $NewSymbol = $LowSymbol; $NewDiff = $LowDiff }
				1 { $NewSymbol = $HighSymbol; $NewDiff = $HighDiff }
			}
			$NewPoints.Add((New-Object psobject -Property @{ Location = $Points[$i].Location + $NewDiff; Symbol = $NewSymbol })) | Out-Null
		}
		$Points[$i].Symbol = $Symbol
		$Points[$i].Location += $Diff
	}
	$Points.AddRange($NewPoints)
}

if ($Start -like $null)
{
	$Start = Get-Random -Minimum 1 -Maximum $Width
}
$Points = New-Object System.Collections.ArrayList
$Points.Add((New-Object psobject -Property @{ location = $Start; Symbol = "|" })) | Out-Null
while ((DrawLine $Points))
{
	Start-Sleep -Milliseconds $Speed
	MovePoints $Points
}