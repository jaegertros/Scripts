<#
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.0/python-3.7.0.exe" -OutFile "c:/temp/python-3.7.0.exe"

c:/temp/python-3.7.0.exe /quiet InstallAllUsers=1 CompileAll=1 PrependPath=1 Include_debug=1 Include_symbols=1

#>

[CmdletBinding()] Param(
    $pythonVersion = "3.6.2"
    $pythonUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion.exe"
    $pythonDownloadPath = 'C:\Tools\python-$pythonVersion.exe'
    $pythonInstallDir = "C:\Tools\Python$pythonVersion"
)

(New-Object Net.WebClient).DownloadFile($pythonUrl, $pythonDownloadPath)
& $pythonDownloadPath /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 TargetDir=$pythonInstallDir
if ($LASTEXITCODE -ne 0) {
    throw "The python installer at '$pythonDownloadPath' exited with error code '$LASTEXITCODE'"
}
# Set the PATH environment variable for the entire machine (that is, for all users) to include the Python install dir
[Environment]::SetEnvironmentVariable("PATH", "${env:path};${pythonInstallDir}", "Machine")

<#
All other options are passed as name=value, where the value is usually 0 to disable a feature, 1 to enable a feature, or a path. The full list of available options is shown below.

Name

Description

Default

InstallAllUsers

Perform a system-wide installation.

0

TargetDir

The installation directory

Selected based on InstallAllUsers

DefaultAllUsersTargetDir

The default installation directory for all-user installs

%ProgramFiles%\Python X.Y or %ProgramFiles(x86)%\Python X.Y

DefaultJustForMeTargetDir

The default install directory for just-for-me installs

%LocalAppData%\Programs\PythonXY or %LocalAppData%\Programs\PythonXY-32

DefaultCustomTargetDir

The default custom install directory displayed in the UI

(empty)

AssociateFiles

Create file associations if the launcher is also installed.

1

CompileAll

Compile all .py files to .pyc.

0

PrependPath

Add install and Scripts directories to PATH and .PY to PATHEXT

0

Shortcuts

Create shortcuts for the interpreter, documentation and IDLE if installed.

1

Include_doc

Install Python manual

1

Include_debug

Install debug binaries

0

Include_dev

Install developer headers and libraries

1

Include_exe

Install python.exe and related files

1

Include_launcher

Install Python Launcher for Windows.

1

InstallLauncherAllUsers

Installs Python Launcher for Windows for all users.

1

Include_lib

Install standard library and extension modules

1

Include_pip

Install bundled pip and setuptools

1

Include_symbols

Install debugging symbols (*.pdb)

0

Include_tcltk

Install Tcl/Tk support and IDLE

1

Include_test

Install standard library test suite

1

Include_tools

Install utility scripts

1

LauncherOnly

Only installs the launcher. This will override most other options.

0

SimpleInstall

Disable most install UI

0

SimpleInstallDescription

A custom message to display when the simplified install UI is used.

(empty)

#>