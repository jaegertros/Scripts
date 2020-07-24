$keys = Import-Csv -Path "J:\HEVC\Registry_HEVC.csv" -Delimiter ','
$tempFolder = 'J:\HEVC\temp'
$outputFile = 'J:\HEVC\merged.reg'

ForEach ($key in $keys) {
  $i++
  & reg export -KeyName $key -FileName "$tempFolder\$i.reg"
}

'Windows Registry Editor Version 5.00' | Set-Content $outputFile
Get-Content "$tempFolder\*.reg" | ? {
  $_ -ne 'Windows Registry Editor Version 5.00'
} | Add-Content $outputFileP