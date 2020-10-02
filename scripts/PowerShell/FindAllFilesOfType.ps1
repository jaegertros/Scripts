<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-09-25 10:20 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


$kind = "video"
$folder = 'C:'

$objConnection = New-Object -com ADODB.Connection
$objRecordSet = New-Object -com ADODB.Recordset
$objConnection.Open("Provider=Search.CollatorDSO;Extended Properties='Application=Windows';")
$objRecordSet.Open("SELECT System.ItemPathDisplay FROM SYSTEMINDEX WHERE System.Kind = '$kind' AND System.ItemPathDisplay LIKE '$folder\%'", $objConnection)
if ($objRecordSet.EOF -eq $false) { $objRecordSet.MoveFirst() }

while ($objRecordset.EOF -ne $true)
{
	$objRecordset.Fields.Item("System.ItemPathDisplay").Value
	$objRecordset.MoveNext()
} 