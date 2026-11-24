<#
DEPLOYSMART

Name=Total Commander
Description=Downloads and installs the latest available version of Total Commander silently.
Author=Mattias Magnusson
Version=1.0.0

Created=2025-08-22
Modified=2026-11-16

Category=Utilities

Tags=File Manager,Explorer Replacement,Productivity

Publisher=C. Ghisler & Co.
Website=https://www.ghisler.com

RequiresAdmin=true
RequiresInternet=true

License=Commercial

END DEPLOYSMART
#>
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$installerUrl = "https://totalcommander.ch/115801/tcmd115801x64.exe"
$installerPath = "C:\DeploySmart\TempPath\tcmd115801x64.exe"
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath -UseBasicParsing
Start-Process -FilePath $installerPath -ArgumentList "/AHN*" -Wait -NoNewWindow
Remove-Item -Path $installerPath -Force
