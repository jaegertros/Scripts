<#
$BaseDir = "G:\Users\cwadd\Documents\GitHub\Adobe-CEP"
$NameToFind = ".git"

$MyVariable = Get-ChildItem $BaseDir -Recurse -Force | Where-Object { $_.PSIsContainer -and $_.Name.EndsWith($NameToFind)}
$MyVariable
$RepoFolder = Split-Path -Path $MyVariable -Parent
$RepoFolder
#>

$BaseDir = "G:\Users\cwadd\Documents\GitHub"
$NameToFind = ".git"

$files = Get-ChildItem $BaseDir -Recurse -Force -Directory -Include .git | select FullName
foreach ($file in $files) {
    $files


#foreach ($file in $files) {
    #$files.BaseName
   # $RepoFolder = Split-Path -Path $file.FullName -Parent
    #$RepoFolder
}