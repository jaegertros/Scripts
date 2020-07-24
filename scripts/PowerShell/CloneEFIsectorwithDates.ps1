$src = "X:\EFI"
$dest = "C:\Users\cwaddel\Documents\GitHub\CompSettings\EFI\PowerShellBackup"
$src = $src.Replace("\","\\")

$i = Get-ChildItem -Path $src -Recurse
$i | % {     ## -- All files and folders

    $apath = $_.FullName -Replace $src,""
    $cpath = $dest + $apath

    Copy-Item -Path $_.FullName -Destination $cpath -Force

    If (Test-Path $cpath)
       {
           Set-ItemProperty -Path $cpath -Name CreationTime -Value $_.CreationTime
           Set-ItemProperty -Path $cpath -Name LastWriteTime -Value $_.LastWriteTime
           Set-ItemProperty -Path $cpath -Name LastAccessTime -Value $_.LastAccessTime
       }
    }

$d = Get-ChildItem -Path $src -Recurse -Directory
$d | % {     ## -- Folders only

    $apath = $_.FullName -Replace $src,""
    $cpath = $dest + $apath

    If (Test-Path $cpath)
       {
           Set-ItemProperty -Path $cpath -Name CreationTime -Value $_.CreationTime
           Set-ItemProperty -Path $cpath -Name LastWriteTime -Value $_.LastWriteTime
           Set-ItemProperty -Path $cpath -Name LastAccessTime -Value $_.LastAccessTime
       }
    }
