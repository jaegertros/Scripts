<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-09-01 1:48 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
Function Test-IsEmpty
{
	[cmdletbinding()]
	Param (
		[Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[ValidateScript({
				if (Test-Path $_)
				{
					$True
				}
				else
				{
					Throw "Cannot validate path $_"
				}
			})]
		[Alias("Fullname", "PSPath")]
		[string]$Path = (Get-Location),
		[Switch]$Quiet
	)
	
	Begin
	{
		Write-Verbose "Starting $($MyInvocation.Mycommand)"
	} #begin
	
	Process
	{
		Write-Verbose "Processing $Path"
		$Count = (Get-Item -path $Path).GetFileSystemInfos().Count
		if ($count -gt 0)
		{
			$IsEmpty = $False
		}
		else
		{
			$IsEmpty = $True
		}
		$result = [pscustomobject]@{
			Path    = $Path
			Count   = $Count
			IsEmpty = $IsEmpty
		}
		
		if ($Quiet)
		{
			#only write a boolean value to the pipeline
			$result.IsEmpty
		}
		else
		{
			$result
		}
		
	} #process
	
	
	End
	{
		Write-Verbose "Ending $($MyInvocation.Mycommand)"
	} #end
} #end function