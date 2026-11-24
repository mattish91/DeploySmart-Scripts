<#
.SYNOPSIS
Automate the installation of Mozilla Firefox.

.DESCRIPTION
Downloads and installs the latest available version of Mozilla Firefox.
Designed for unattended deployments and remote management systems.

.NOTES
Author      : Mattias Magnusson
Company     : Mspot / DeploySmart
Created     : 2025-06-09
Modified    : 2026-11-24
Version     : 1.0.0
License     : MIT

.REQUIREMENTS
- PowerShell 5.1 or later
- Administrator privileges
- Internet connection

.EXAMPLE
.\Install-Firefox.ps1

Installs the latest version of Firefox using default settings.

.OUTPUTS
None

.EXITCODES
0 = Success
1 = General Error
2 = Download Failed
3 = Installation Failed

.CHANGELOG

1.0.0
- Initial release
#>

$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\DeploySmart\TempPath"
mkdir $tp -ErrorAction SilentlyContinue
$Url = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US"
$Installer = "FirefoxSetup.msi"
Invoke-WebRequest -Uri $Url -OutFile "$tp\$Installer" -ErrorAction Stop
Start-Process -FilePath "$tp\$Installer" -ArgumentList "/q /norestart" -Wait
Start-Sleep -Seconds 30
Remove-Item -Path "$tp\$Installer" -Force
