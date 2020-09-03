# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir="$env:USERPROFILE\.choco"
$env:ChocolateyInstall="$InstallDir"

if(-not (Test-Path $InstallDir)){
    New-Item $installDir -ItemType Directory -Verbose
}

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass -Scope Process -Force;

$env:chocolateyUseWindowsCompression = 'true'

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
