# Delete C:\Windows.old if it exists.
if (Test-Path "C:\Windows.old") {
Remove-Item -Path "C:\Windows.old" -Recurse -Force
}

# Delete C:\TempPath if it exists.
if (Test-Path "C:\DeploySmart\TempPath") {
Remove-Item -Path "C:\DeploySmart\TempPath" -Recurse -Force
}

# Clean up the Dell CCTK Toolkit left behind after BIOS password is set. (If ever used)
msiexec.exe /x "{C8EA30FC-B20B-465E-9D8A-CDDC09EA72D4}" /qn /norestart

# Cleanup sensitive leftovers from deployment.
if (Test-Path "C:\Windows\Setup\Scripts") {
Move-Item -Path "C:\Windows\Setup\Scripts\*.log" -Destination "C:\DeploySmart\logs\" -Force
Remove-Item -Path "C:\Windows\Setup\Scripts" -Recurse -Force
}
