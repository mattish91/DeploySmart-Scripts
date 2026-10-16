# Script made by Mattias Magnusson 2026-09-23
# Installs EA App (latest)
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\TempPath" 
$Installer = "EAappInstaller.exe"
mkdir $tp -EA SilentlyContinue
$Url1 = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe"
Invoke-WebRequest -Uri $Url1 -OutFile $tp\$Installer
Start-Process $tp\$Installer -Wait -ArgumentList "/S"
Start-Sleep -Seconds 30
del $tp\$Installer