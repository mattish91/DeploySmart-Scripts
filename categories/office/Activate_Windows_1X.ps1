# .SYNOPSIS
# Activates Windows through your authorized KMS host.
#
# .DESCRIPTION
# Before use, edit $KmsServer below in DeploySmart under Custom Scripts and
# replace the placeholder with your organization's authorized KMS host. If you
# do not use KMS activation, remove this script from your custom scripts.
# Script made by Mattias Magnusson 2025-05-20
# Modified: 2025-09-20
$KmsServer = 'REPLACE_WITH_YOUR_AUTHORIZED_KMS_SERVER'

if ($KmsServer -eq 'REPLACE_WITH_YOUR_AUTHORIZED_KMS_SERVER') {
    throw 'Edit $KmsServer in DeploySmart under Custom Scripts and set your authorized KMS host before running this activation script.'
}

$slmgr = Join-Path $env:WINDIR 'System32\slmgr.vbs'
cscript.exe //nologo $slmgr /skms $KmsServer
if ($LASTEXITCODE -ne 0) { throw 'Unable to set the Windows KMS host.' }
Start-Sleep -Seconds 10
Write-Host 'Activating Windows...'
cscript.exe //nologo $slmgr /ato
if ($LASTEXITCODE -ne 0) { throw 'Windows activation failed.' }