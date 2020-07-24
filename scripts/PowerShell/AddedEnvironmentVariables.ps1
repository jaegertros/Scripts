###########SYSTEM###############################################################

#[Environment]::SetEnvironmentVariable("TestVariableName", "My Value", "<option>")

##[Environment]::SetEnvironmentVariable("myY", "la la", "User")
#OR
##[Environment]::SetEnvironmentVariable("myY", "la la", "Machine")

[Environment]::SetEnvironmentVariable("JDK_16", "C:\tools\Java\1.6\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_17", "C:\tools\Java\1.7\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_18", "C:\tools\Java\1.8\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_9", "C:\tools\Java\9\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_10", "C:\tools\Java\10\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_11", "C:\tools\Java\11\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_12", "C:\tools\Java\12\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_13", "C:\tools\Java\13\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_14", "C:\tools\Java\14\", "Machine")
[Environment]::SetEnvironmentVariable("JDK_15", "C:\tools\Java\15\", "Machine")

###########USER###############################################################

# example of adding a path to PATH
#[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Program Files (x86)\PHP", "Machine")

[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\tools\Java\14\", "USER")
[System.Environment]::SetEnvironmentVariable("Path", $Env:Path + ";%JAVA_HOME%\bin", "User")

PAUSE