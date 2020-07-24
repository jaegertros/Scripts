New-NetFirewallRule -DisplayName "53380 qBittorrent TCP Inbound" -Direction Inbound -LocalPort 53380 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "53380 qBittorrent TCP Outbound" -Direction Outbound -LocalPort 53380 -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "53380 qBittorrent UDP Inbound" -Direction Inbound -LocalPort 53380 -Protocol UDP -Action Allow
New-NetFirewallRule -DisplayName "53380 qBittorrent UDP Outbound" -Direction Outbound -LocalPort 53380 -Protocol UDP -Action Allow

New-NetFirewallRule -DisplayName "53380 qBittorrent TCP Inbound over Teredo" -Direction Inbound -LocalPort 53380 -Protocol TCP -EdgeTraversalPolicy Allow -Action Allow

New-NetFirewallRule -DisplayName "53380 qBittorrent TCP Inbound over Teredo" -Direction Inbound -LocalPort 53380 -Protocol UDP -EdgeTraversalPolicy Allow -Action Allow