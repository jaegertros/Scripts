<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-09-28 12:52 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

function Control-VMWareServices
{
	Write-Host "Start/Stop VMware Workstation services"
	
	# PROMPT FOR USER INPUT
	
	Write-Color "1 ", "Press 1 to start VMWare Workstation Services" -Color Yellow, Green
	Write-Color "2 ", "Press 2 to stop VMWare Workstation Services" -Color Yellow, Red
	Write-Color "9 ", "Press 9 to exit" -Color Yellow, Gray -LinesBefore 1
	$USER_INPUT = Read-Host 
	Clear-Host
	if ($USER_INPUT -eq 1)
	{
		Write-Host "Starting VMware Authorization Service" -ForegroundColor Green
		Start-Service "VMware Authorization Service"
		Write-Host "Starting VMware Agent Service" -ForegroundColor Green
		Start-Service "VMware Agent Service"
		Write-Host "Starting VMware NAT Service" -ForegroundColor Green
		Start-Service "VMware NAT Service"
		Write-Host "Starting VMware DHCP Service" -ForegroundColor Green
		Start-Service "VMware DHCP Service"
		Write-Host "Starting VMware USB Arbitration Service" -ForegroundColor Green
		Start-Service "VMware USB Arbitration Service"
		Write-Host "Starting VMware Workstation Service" -ForegroundColor Green
		Start-Service "VMware Workstation"
		Pause
	}
	elseif ($USER_INPUT -eq 2)
	{
		Write-Host "Stopping VMware Authorization Service" -ForegroundColor Red
		Stop-Service "VMware Authorization Service"
		Write-Host "Stopping VMware Agent Service" -ForegroundColor Red
		Stop-Service "VMware Agent Service"
		Write-Host "Stopping VMware NAT Service" -ForegroundColor Red
		Stop-Service "VMware NAT Service"
		Write-Host "Stopping VMware DHCP Service" -ForegroundColor Red
		Stop-Service "VMware DHCP Service"
		Write-Host "Stopping VMware Workstation Service" -ForegroundColor Red
		Stop-Service "VMware Workstation"
		Pause
	}
	elseif ($USER_INPUT -eq 9)
	{
		Exit
	}
	else
	{
		Return $USER_INPUT
	}
}

$ControlVMWareServices = Control-VMWareServices
# Do more stuff.
# SIG # Begin signature block
# MIIQzwYJKoZIhvcNAQcCoIIQwDCCELwCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDfTzijDcKAJCn2
# vFPCGVAggGWwJkfGL20SsytkIUPc1qCCC8kwggLiMIIByqADAgECAhBQobJiOw/W
# p0Eob+1OVVlYMA0GCSqGSIb3DQEBCwUAMBIxEDAOBgNVBAMTB2N3YWRkZWwwHhcN
# MjAwNjE4MTkyNzE0WhcNMjEwNjE5MDEyNzE0WjASMRAwDgYDVQQDEwdjd2FkZGVs
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1WuZQHLnXTkzQryU6/CY
# WkM3cYxSRamZofi95SikVY0Wg+ir6pHjeEkf8tQyespvrIHatb9tvFgmxmOptZoX
# N1q8DJclhmu3yapQ8p/UqoopQ2AHLoqa/TEEhR1mq0ijp4hVD1dMGlcxbI1Fk6Ju
# n+CUBR29YMjMCcUvb1iDAtwr3rNdATfwnoGiajtZYTxrqyDt9fq3yPkkBhTdr+Vv
# JyJSmzY1FicBtUu8sT4JMV/vRdqbr28wZG/GqVCR+lGTtj9R37y0qJ7I6sCjzUip
# uqs/IGsfr0gUc4+h4ol/3KZUXlzbcj0TpKadFle2msBaicTslst63WyITTgeJXY3
# gQIDAQABozQwMjAMBgNVHRMBAf8EAjAAMCIGA1UdJQEB/wQYMBYGCCsGAQUFBwMD
# BgorBgEEAYI3VAMBMA0GCSqGSIb3DQEBCwUAA4IBAQAmFCBGCGV5Y0FOqgfO5SJ8
# NwtuM7ERRox+BDwmz/tO1c2Z2hIkG3JYIh5Fv9B9NhZNP7hN4sosv1lYi5RX25Ub
# sJuc5U5T6U5dz8ymSmJUVW53+S3g8MrHrC82tx7F7tDKiKMgSNiVgiRPIieL+KCy
# V4/X/Pd02d3a20BONH7ox9Yykbmh1RJA0u4FyR4xH5/8PT6dtM5sEjmuK2Wtk/JZ
# eMsJUeuG85IoJpH/Jek1hkWYqgptHcttg0KMO4+7SWmwop19uz1So3zKJXLC3a5q
# OL+4bYM5XsBhYMADVOtJni4Alo2m8fpz74Eezyo6dTb0XuJUY24HNKOgFr1gUYw9
# MIIEFTCCAv2gAwIBAgILBAAAAAABMYnGUAQwDQYJKoZIhvcNAQELBQAwTDEgMB4G
# A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNp
# Z24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMTEwODAyMTAwMDAwWhcNMjkwMzI5
# MTAwMDAwWjBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1z
# YTExMC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEyNTYg
# LSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKqbjsOrEVElAbaW
# lOJP2MEI9kYj2UXFlZdbqxq/0mxXyTMGH6APxjx+U0h6v52Hnq/uw4xH4ULs4+Oh
# SmwMF8SmwbnNW/EeRImO/gveIVgT7k3IxWcLHLKz8TR2kaLLB203xaBHJgIVpJCR
# qXme1+tXnSt8ItgU1/EHHngiNmt3ea+v+X+OTuG1CDH96u1LcWKMI/EDOY9EebZ2
# A1eerS8IRtzSjLz0jnTOyGhpUXYRiw9dJFsZVD0mzECNgicbWSB9WfaTgI74Kjj9
# a6BAZR9XdsxbjgRPLKjbhFATT8bci7n43WlMiOucezAm/HpYu1m8FHKSgVe3dsnY
# gAqAbgkCAwEAAaOB6DCB5TAOBgNVHQ8BAf8EBAMCAQYwEgYDVR0TAQH/BAgwBgEB
# /wIBADAdBgNVHQ4EFgQUkiGnSpVdZLCbtB7mADdH5p1BK0wwRwYDVR0gBEAwPjA8
# BgRVHSAAMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29t
# L3JlcG9zaXRvcnkvMDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
# c2lnbi5uZXQvcm9vdC1yMy5jcmwwHwYDVR0jBBgwFoAUj/BLf6guRSSuTVD6Y5qL
# 3uLdG7wwDQYJKoZIhvcNAQELBQADggEBAARWgkp80M7JvzZm0b41npNsl+gGzjEY
# WflsQV+ALsBCJbgYx/zUsTfEaKDPKGoDdEtjl4V3YTvXL+P1vTOikn0RH56KbO8s
# sPRijTZz0RY28bxe7LSAmHj80nZ56OEhlOAfxKLhqmfbs5xz5UAizznO2+Z3lae7
# ssv2GYadn8jUmAWycW9Oda7xPWRqO15ORqYqXQiS8aPzHXS/Yg0jjFwqOJXSwNXN
# z4jaHyi1uoFpZCq1pqLVc6/cRtsErpHXbsWYutRHxFZ0gEd4WIy+7yv97Gy/0ZT3
# v1Dge+CQ/SAYeBgiXQgujBygl/MdmX2jnZHTBkROBG56HCDjNvC2ULkwggTGMIID
# rqADAgECAgwkVLh/HhRTrTf6oXgwDQYJKoZIhvcNAQELBQAwWzELMAkGA1UEBhMC
# QkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAvBgNVBAMTKEdsb2JhbFNp
# Z24gVGltZXN0YW1waW5nIENBIC0gU0hBMjU2IC0gRzIwHhcNMTgwMjE5MDAwMDAw
# WhcNMjkwMzE4MTAwMDAwWjA7MTkwNwYDVQQDDDBHbG9iYWxTaWduIFRTQSBmb3Ig
# TVMgQXV0aGVudGljb2RlIGFkdmFuY2VkIC0gRzIwggEiMA0GCSqGSIb3DQEBAQUA
# A4IBDwAwggEKAoIBAQDZeGGhlq4S/6P/J/ZEYHtqVi1n41+fMZIqSO35BYQObU4i
# VsrYmZeOacqfew8IyCoraNEoYSuf5Cbuurj3sOxeahviWLW0vR0J7c3oPdRm/74i
# Im02Js8ReJfpVQAow+k3Tr0Z5ReESLIcIa3sc9LzqKfpX+g1zoUTpyKbrILp/vFf
# xBJasfcMQObSoOBNaNDtDAwQHY8FX2RV+bsoRwYM2AY/N8MmNiWMew8niFw4MaUB
# 9l5k3oPAFFzg59JezI3qI4AZKrNiLmDHqmfWs0DuUn9WDO/ZBdeVIF2FFUDPXpGV
# UZ5GGheRvsHAB3WyS/c2usVUbF+KG/sNKGHIifAVAgMBAAGjggGoMIIBpDAOBgNV
# HQ8BAf8EBAMCB4AwTAYDVR0gBEUwQzBBBgkrBgEEAaAyAR4wNDAyBggrBgEFBQcC
# ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0T
# BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBGBgNVHR8EPzA9MDugOaA3hjVo
# dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzL2dzdGltZXN0YW1waW5nc2hhMmcy
# LmNybDCBmAYIKwYBBQUHAQEEgYswgYgwSAYIKwYBBQUHMAKGPGh0dHA6Ly9zZWN1
# cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzdGltZXN0YW1waW5nc2hhMmcyLmNy
# dDA8BggrBgEFBQcwAYYwaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL2dzdGlt
# ZXN0YW1waW5nc2hhMmcyMB0GA1UdDgQWBBTUh7iN5uVAPJ1aBmPGRYTZ3bscwzAf
# BgNVHSMEGDAWgBSSIadKlV1ksJu0HuYAN0fmnUErTDANBgkqhkiG9w0BAQsFAAOC
# AQEAJHJQpQy8QAmmwfTVgmpOQV/Ox4g50+R8+SJsOHi49Lr3a+Ek6518zUisi+y1
# dkyP3IJpCJbnuuFntvCmvxgIQuHrzRlYOaURYSPWGdcA6bvS+V9B+wQ+/oogYAzR
# TyNaGRoY79jG3tZfVKF6k+G2d4XA+7FGxAmuL1P7lZyOJuJK5MTmPDXvusbZucXN
# zQebY7s9D2G8VXwjELWMiqPSaEWxQLqg3TwbFUC4SXhv5ZTAbVZLPPYSKtSF80gT
# BeG7MEUKQbd8km6+TpJggspbZOZV09IH3p1fm6EB7Zvww127GfAYDJqgHOlqCAs9
# 6WaXp3UeD78o1wkjDeIW+rrzNDGCBFwwggRYAgEBMCYwEjEQMA4GA1UEAxMHY3dh
# ZGRlbAIQUKGyYjsP1qdBKG/tTlVZWDANBglghkgBZQMEAgEFAKBMMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMC8GCSqGSIb3DQEJBDEiBCCqCENWEU4E1J1gKTQa
# RbQUAUBAzlKE0NicaodnwCTRTzANBgkqhkiG9w0BAQEFAASCAQBfUy6tN55Pk1S/
# j4SWn+HRd0mx096+jqWnaAx1tqGWwI3LUXlabASXK2te+tngeexgSCjnhyn+kqNE
# yTnBpn1TzKKsrgHQoqTmgHF2aJR11JKzheiwiIgexVrqi4hdcBLp8HzuazG/DKuu
# fARD4s7sgvi7qj7dyC+MNhXn57pSELq/O5ISn8W3DwQNKfxsD8gmAkCV8EPS6Azs
# TFR92gFSJ1nIAPTqicDfTZ3Y8B1XJgNyz+ABVHUxV7N7GPEPxAgjiyE89gvxl43P
# 7ofDJtF0IMNG0wx3TxhqKzp9U3uH/+T849WPauUle6MCSx8Baca0ugFzzXAyuiMh
# XeWPvd5eoYICuTCCArUGCSqGSIb3DQEJBjGCAqYwggKiAgEBMGswWzELMAkGA1UE
# BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAvBgNVBAMTKEdsb2Jh
# bFNpZ24gVGltZXN0YW1waW5nIENBIC0gU0hBMjU2IC0gRzICDCRUuH8eFFOtN/qh
# eDANBglghkgBZQMEAgEFAKCCAQwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAc
# BgkqhkiG9w0BCQUxDxcNMjAwOTI4MjAyNzA5WjAvBgkqhkiG9w0BCQQxIgQgOUUb
# gm09fEl+mQYK171DvH3HN+FS7cegP+6cWAGpD+4wgaAGCyqGSIb3DQEJEAIMMYGQ
# MIGNMIGKMIGHBBQ+x2bV1NRy4hsfIUNSHDG3kNlLaDBvMF+kXTBbMQswCQYDVQQG
# EwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFs
# U2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEyNTYgLSBHMgIMJFS4fx4UU603+qF4
# MA0GCSqGSIb3DQEBAQUABIIBAIK2JXR6acTdUMA1B9oHty4JvwqyHrRMFJ0LwFS5
# wL3A7aTELzLHBtmJkKTwpib0wHSCDhquwspyQpaKSVK6KSR3BpvPsn1Tkdt+QY5+
# VftcAEkcmCWi5M99vn9ypxAVOCAlFLKmmudNCCoUpbuDXNLTa5Y0fhCR/znd4QvL
# lqUMvrZU3YG050R4AwH6eMHqSbJCQkkbxmiUcJA2M+hdnj4D7kugf5vK6LumS3ST
# u+L0l6OStRd95riGI1t6doDNHbThppXb/QlVxBUCqauW3gTXZBe4JfdTWKubvP/f
# SW9bs7r1MLPP3A/XTuH8nffw1olHvvzacM+iQVABCiBvP3k=
# SIG # End signature block
