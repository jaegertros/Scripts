New-Item -Path "HKEY_CLASSES_ROOT\.ps1" -Name ShellNew –Force
New-ItemProperty -Path "HKEY_CLASSES_ROOT\.ps1\ShellNew" -Name "Filename" -Value "Template.ps1" -PropertyType String