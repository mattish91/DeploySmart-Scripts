# Script made by Mattias Magnusson 2026-09-23
# Installs Steam (latest)
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\TempPath" 
$Installer = "SteamSetup.exe"
mkdir $tp -EA SilentlyContinue
$Url1 = "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
Invoke-WebRequest -Uri $Url1 -OutFile $tp\$Installer
Start-Process $tp\$Installer -Wait -ArgumentList "/S"
Start-Sleep -Seconds 30
del $tp\$Installer