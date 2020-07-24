# obtain IP address of the hostname
$ips = [System.Net.Dns]::GetHostAddresses("Your.ddnshostname.here")

# define regex to extract the IP address only
$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"

# extract the IP address from $ips string
$ip2 = $regex.Matches($ips) | %{ $_.value }

# here you can replace 1.1.1.1 with a static IP address should you wish to add more than one IP. The firewall allow IP will be overwritten with these new IP information. If you don't wish to use this line, then set $iplist = $ip2
$iplist = "$ip2,1.1.1.1"

netsh advfirewall firewall set rule name="The Name of Firewall Rule" new remoteip= $iplist