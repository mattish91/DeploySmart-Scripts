# Automate the installation of TotalCommander.
# Script made by Mattias Magnusson 2025-08-22
# Updated 2026-11-16
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$installerUrl = "https://totalcommander.ch/115801/tcmd115801x64.exe"
$installerPath = "C:\DeploySmart\TempPath\tcmd115801x64.exe"
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath -UseBasicParsing
Start-Process -FilePath $installerPath -ArgumentList "/AHN*" -Wait -NoNewWindow
Remove-Item -Path $installerPath -Force
