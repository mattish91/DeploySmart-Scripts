# Automate the install of 7-Zip (Targeting Latest Version)
# Script updated: 2026-04-22
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\TempPath"
if (-not (Test-Path $tp)) {
    New-Item -Path $tp -ItemType Directory -Force | Out-Null
}
$owner = "ip7z"
$repo = "7zip"
$latestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/releases/latest"
$asset = $latestRelease.assets | Where-Object { $_.name -like "*-x64.msi" } | Select-Object -First 1
$assetUrl = $asset.browser_download_url
$installerPath = "$tp\$($asset.name)"
Invoke-WebRequest -Uri $assetUrl -OutFile $installerPath
Start-Process msiexec.exe -Wait -ArgumentList "/i `"$InstallerPath`" /qn" -Verb RunAs
Start-Sleep -Seconds 10
del $installerPath