# Automate the install of ArtCraft Launcher.
# Script made by Mattias Magnusson 2026-10-14
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\TempPath" 
mkdir $tp -EA SilentlyContinue
$owner = "storytold"
$repo = "craft-launcher"
$latestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/releases/latest"
$asset = $latestRelease.assets | Where-Object { $_.name -like "artcraft-launcher-*-windows-x64.msi" } | Select-Object -First 1
$assetUrl = $asset.browser_download_url
$installerPath = "$tp\$($asset.name)"
Invoke-WebRequest -Uri $assetUrl -OutFile $installerPath
Start-Process -FilePath $installerPath -ArgumentList "/qn /norestart" -Wait
Start-Sleep -Seconds 30
del $installerPath
