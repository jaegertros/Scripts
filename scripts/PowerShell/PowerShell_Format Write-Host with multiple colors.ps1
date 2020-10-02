<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-09-28 12:59 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


Write-Color -Text "Red ", "Green ", "Yellow " -Color Red, Green, Yellow
Write-Color -Text "This is text in Green ",
			"followed by red ",
			"and then we have Magenta... ",
			"isn't it fun? ",
			"Here goes DarkCyan" -Color Green, Red, Magenta, White, DarkCyan
Write-Color -Text "This is text in Green ",
			"followed by red ",
			"and then we have Magenta... ",
			"isn't it fun? ",
			"Here goes DarkCyan" -Color Green, Red, Magenta, White, DarkCyan -StartTab 3 -LinesBefore 1 -LinesAfter 1
Write-Color "1. ", "Option 1" -Color Yellow, Green
Write-Color "2. ", "Option 2" -Color Yellow, Green
Write-Color "3. ", "Option 3" -Color Yellow, Green
Write-Color "4. ", "Option 4" -Color Yellow, Green
Write-Color "9. ", "Press 9 to exit" -Color Yellow, Gray -LinesBefore 1
Write-Color -LinesBefore 2 -Text "This little ", "message is ", "written to log ", "file as well." `
			-Color Yellow, White, Green, Red, Red -LogFile "C:\testing.txt" -TimeFormat "yyyy-MM-dd HH:mm:ss"
Write-Color -Text "This can get ", "handy if ", "want to display things, and log actions to file ", "at the same time." `
			-Color Yellow, White, Green, Red, Red -LogFile "C:\testing.txt"