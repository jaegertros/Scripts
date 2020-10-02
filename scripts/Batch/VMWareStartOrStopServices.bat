@echo off
echo Start/Stop VMware Workstation services
echo.
echo 1. Start
echo 2. Stop
echo.
choice /c:12

If errorlevel 1 if not errorlevel 2 goto start
If errorlevel 2 if not errorlevel 3 goto stop

:start
echo.
net start “VMware Authorization Service”
net start “VMware Agent Service”
net start “VMware NAT Service”
net start “VMware DHCP Service”
net start “VMware USB Arbitration Service”
goto end

:stop
echo.
net stop “VMware Authorization Service”
net stop “VMware Agent Service”
net stop “VMware NAT Service”
net stop “VMware DHCP Service”
net stop “VMware USB Arbitration Service”
goto end

:end