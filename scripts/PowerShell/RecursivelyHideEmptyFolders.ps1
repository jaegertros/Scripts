$tdc="O:\Users\cwadd\Prawn\OSite"
Start-Transcript -OutputDirectory $tdc -NoClobber
do {
$dirs = gci $tdc -directory -recurse | Where { (gci $_.fullName).count -eq 0 } | select -expandproperty FullName
$dirs | Foreach-Object {
$thewholepath = $_
$thewholepath
$theatts = (Get-ItemProperty -Path $thewholepath).attributes
$theatts
$theatts+= 'Hidden'
$theatts
}
} while ($dirs.count -gt 0)