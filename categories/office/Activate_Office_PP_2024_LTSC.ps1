# .SYNOPSIS
# Activates Office Professional Plus 2024 LTSC through your authorized KMS host.
#
# .DESCRIPTION
# Before use, edit $KmsServer below in DeploySmart under Custom Scripts and
# replace the placeholder with your organization's authorized KMS host. If you
# do not use KMS activation, remove this script from your custom scripts.
# Script made by Mattias Magnusson 2025-08-22
$KmsServer = 'REPLACE_WITH_YOUR_AUTHORIZED_KMS_SERVER'

if ($KmsServer -eq 'REPLACE_WITH_YOUR_AUTHORIZED_KMS_SERVER') {
    throw 'Edit $KmsServer in DeploySmart under Custom Scripts and set your authorized KMS host before running this activation script.'
}

$ospp = 'C:\Program Files\Microsoft Office\Office16\ospp.vbs'
if (-not (Test-Path -LiteralPath $ospp)) {
    throw "Office licensing script was not found at $ospp."
}

cscript.exe //nologo $ospp /sethst $KmsServer
if ($LASTEXITCODE -ne 0) { throw 'Unable to set the Office KMS host.' }
Start-Sleep -Seconds 10
cscript.exe //nologo $ospp /cachst:TRUE
if ($LASTEXITCODE -ne 0) { throw 'Unable to cache the Office KMS host.' }
Start-Sleep -Seconds 10
cscript.exe //nologo $ospp /act
if ($LASTEXITCODE -ne 0) { throw 'Office activation failed.' }