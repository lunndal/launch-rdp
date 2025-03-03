<#
.SYNOPSIS
Launch RDP session with merged config from tempalte.

.DESCRIPTION
The script performs the following actions:

1. Replaces values in a RDP file based on a template. 
2. Adds properties from template missing in RDP file.
3. Launches RDP with the merged configuration.

Terje With Lunndal <terje@lunndal.priv.no>

.EXAMPLE
launch-rdp.ps1 -File SG-webmmgmt0668_padmxyz600.rdp -Template ~\mytemplate.rdp
#>

[CmdletBinding()]
param (
    # Path to supplied RDP file.
    [Parameter(Mandatory)]
    [String]
    $File,
    # Path to personal RDP template.
    [Parameter(Mandatory)]
    [String]
    $Template
)

# Make sure we're running PwSh 7 or later.
if ( -not ($PSVersionTable.PSVersion.Major -ge 7)) {
    $host.UI.RawUI.WindowTitle = "Wrong PowerShell version :("
    Write-Host @"
    
[1;93mPowerShell 7 or later is required[0m

Get the latest PwSH here:
https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows

Press any key to exit...
"@

    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}



# Read config files.
$configStr      = Get-Content -Path $File -Raw
$templateStr    = Get-Content -Path $Template -Raw

# Convert to hash tables.
$configHash     = ConvertFrom-StringData -StringData $configStr   -Delimiter ":"
$templateHash   = ConvertFrom-StringData -StringData $templateStr -Delimiter ":"

# Merge template into config.
foreach ( $key in $templateHash.Keys ) {
    $configHash[$key] = $templateHash[$key]
}

# Write merged config to file.
$tempFile = New-TemporaryFile

foreach ( $key in $configHash.Keys ) {

    "$($key):$($configHash[$key])" | Out-File -FilePath $tempFile -Append
}

# Launch RDP client
Start-Process "mstsc.exe" -ArgumentList $tempFile -Wait

# Clean up.
Remove-Item -Path $tempFile -Force