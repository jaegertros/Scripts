<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
	 Created on:   	2020-09-25 8:48 PM
	 Created by:   	cwaddel
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
$workingDir = Read-Host -Prompt 'Please input the full working path'
Start-Transcript -OutputDirectory "$workingDir" -NoClobber
$appendDir = Join-Path -Path $workingDir -ChildPath "*"
$oldvids = Get-ChildItem -Path $appendDir -Include *.3g2, *.3gp, *.amv, *.asf, *.avi, *.drc, *.f4a, *.f4b, *.f4p, *.f4v, *.flv, *.gif, *.gifv, *.M2TS, *.m2v, *.m4p, *.m4v, *.mkv, *.mng, *.mov, *.mp2, *.mp4, *.mpe, *.mpeg, *.mpg, *.mpv, *.MTS, *.mxf, *.nsv, *.ogg, *.ogv, *.qt, *.rm, *.rmvb, *.roq, *.svi, *.TS, *.viv, *.vob, *.webm, *.wmv, *.yuv -Exclude *x265* -Recurse

foreach ($oldvid in $oldvids)
{
	$name = $oldvid.BaseName
	$fullname = $oldvid.FullName
	$extension = $oldvid.Extension
	$newName = "_x265_cvcrf24_cacopy.mp4"
	$newVid = $name + $newName
	$finalPath = Join-Path $workingDir -ChildPath "$newVid"
	Write-Output $finalPath
	ffmpeg -i $fullname -c:v libx265 -crf 24 -c:a copy $finalPath
	
	# source:
	# http://blogs.msdn.com/b/powershell/archive/2006/09/15/errorlevel-equivalent.aspx
	if ($?)
	{
		# True, last operation succeeded
		Remove-Item -Path $fullname -Force
	}
	
	if (!$?)
	{
		# Not True, last operation failed
		Write-Output "$name failed in the conversion process."
	}
}


# SIG # Begin signature block
# MIIQzwYJKoZIhvcNAQcCoIIQwDCCELwCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCTmFs82EOqdnOr
# uM+kvO4G1x+VH6GTY28z0KZVVj0RiaCCC8kwggLiMIIByqADAgECAhBQobJiOw/W
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
# DQEJAzEMBgorBgEEAYI3AgEEMC8GCSqGSIb3DQEJBDEiBCDXRbHG8kB89m0hwS61
# Y2jAVoxMXl2rpFbb8LLXff3lJzANBgkqhkiG9w0BAQEFAASCAQC8kPwu3tWCXA5U
# 5//u8pLlQKVPqPxJHHPmKLQ/4xcwoMiw8vMF6VPMKMuTaTemfYaatQy5HMwHu4KD
# vekW8PpUHML+nUpdsRATzf3eOPdrI6wrWW8MzdznzcZpgx7s6+af1pF1k5bYvUau
# TzJU+mHSF/74bJjlQTJux0CtSBg2SAyjHfQYXzsQfJBuaa3C5z2jqnq1HYnJZZU+
# eAnqyeRIapnwilZsYQcjDCLZRmD58d2eJV7Sl2KMosf4a13cY1PWZ08rZ0pnKwpd
# keX+pAPCaarbuhYTqYw74CTGLgw0x7m9ORigTdFsont5VbeWic9RwYIym16QkMlv
# F9jwiKS4oYICuTCCArUGCSqGSIb3DQEJBjGCAqYwggKiAgEBMGswWzELMAkGA1UE
# BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAvBgNVBAMTKEdsb2Jh
# bFNpZ24gVGltZXN0YW1waW5nIENBIC0gU0hBMjU2IC0gRzICDCRUuH8eFFOtN/qh
# eDANBglghkgBZQMEAgEFAKCCAQwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAc
# BgkqhkiG9w0BCQUxDxcNMjAwOTI2MDIxNTI4WjAvBgkqhkiG9w0BCQQxIgQgYfbI
# JZGmKZWPKpkqXgUAwMlPZlSbOLMMNauS1o2g1J0wgaAGCyqGSIb3DQEJEAIMMYGQ
# MIGNMIGKMIGHBBQ+x2bV1NRy4hsfIUNSHDG3kNlLaDBvMF+kXTBbMQswCQYDVQQG
# EwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFs
# U2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEyNTYgLSBHMgIMJFS4fx4UU603+qF4
# MA0GCSqGSIb3DQEBAQUABIIBAIp7udwUQOrZHEZMHLDvYOdyQcUuA+r8HC0KGhG+
# 1wdCVUOXjhUVysjQpSMGsaoDtta2+99EXLU8XtkABh82IaRJSZMi9GqRtBh2gAPS
# BsZ2FPd51c2oLiv591qwmTQpiCteHYGjO/iEbUDuTkfPuTOB0Io44bS+wBdU6P7n
# FQ2tipkBZpfTUrUHiKOeMxkuhTUl+eJ+SmU9n+dUrhAEEYvmfzSwjfEi0wZ4Ffns
# EE0WXJw4ZV+1fSQXN5IFHNkOlaoWkSSxzy69sgxIHPN887HmE852wrYP2bHE49n5
# qK3PwldHxOo+JsQE2ZehXdf7mI+0GAIbi8TbOODrjGxUBBw=
# SIG # End signature block
