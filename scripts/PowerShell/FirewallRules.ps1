New-NetFirewallRule -DisplayName "63342 JetBrains IDE plugin TCP Inbound" -Direction Inbound -LocalPort 63342 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "63342 JetBrains IDE plugin TCP Outbound" -Direction Outbound -LocalPort 63342 -Protocol TCP -Action Allow

New-NetFirewallRule -DisplayName "63342 JetBrains IDE plugin UDP Inbound" -Direction Inbound -LocalPort 63342 -Protocol UDP -Action Allow
New-NetFirewallRule -DisplayName "63342 JetBrains IDE plugin UDP Outbound" -Direction Outbound -LocalPort 63342 -Protocol UDP -Action Allow

New-NetFirewallRule -DisplayName "63342 JetBrains IDE plugin TCP Inbound over Teredo" -Direction Inbound -LocalPort 63342 -Protocol TCP -EdgeTraversalPolicy Allow -Action Allow

New-NetFirewallRule -DisplayName "63342 JetBrains IDE plugin TCP Inbound over Teredo" -Direction Inbound -LocalPort 63342 -Protocol UDP -EdgeTraversalPolicy Allow -Action Allow