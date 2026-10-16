# Install Microsoft Office Professional Plus 2024 LTSC.
# Script made by Mattias Magnusson 2025-06-09
$ProgressPreference = 'SilentlyContinue'
$tp ="C:\TempPath"
Invoke-WebRequest -Uri "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365ProPlusRetail&language=en-us&platform=def&version=O16GA&source=MktDownloadForWinPage" -OutFile $tp\OfficeSetup.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mattish91/DeploySmart-Scripts/main/categories/office/assets/O24LTSC-configuration.xml" -OutFile "$tp\O24LTSC-configuration.xml"
Start-Process -FilePath "$tp\OfficeSetup.exe" -ArgumentList "/configure `"$tp\O24LTSC-configuration.xml`"" -Wait
Start-Sleep -s 10
Remove-Item -LiteralPath "$tp\OfficeSetup.exe", "$tp\O24LTSC-configuration.xml" -Force