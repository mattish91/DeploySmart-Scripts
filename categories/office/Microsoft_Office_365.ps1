# Automate the install of Microsoft Office 365.
# Script made by Mattias Magnusson 2025-06-05
$ProgressPreference = 'SilentlyContinue'
$tp ="C:\TempPath"
Invoke-WebRequest -Uri "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365ProPlusRetail&language=en-us&platform=def&version=O16GA&source=MktDownloadForWinPage" -OutFile $tp\OfficeSetup.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mattish91/DeploySmart-Scripts/main/categories/office/assets/Configuration.xml" -OutFile "$tp\Configuration.xml"
Start-Process -FilePath "$tp\OfficeSetup.exe" -ArgumentList "/configure `"$tp\Configuration.xml`"" -Wait
Start-Sleep -s 10
Remove-Item -LiteralPath "$tp\OfficeSetup.exe", "$tp\Configuration.xml" -Force