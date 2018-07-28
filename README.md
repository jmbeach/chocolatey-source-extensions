Chocolatey Source Extensions
==============

A Powershell module for viewing [Chocolatey](https://chocolatey.org) package sources

# Usage

To get the `chocolateyInstall.ps1` (main file) of a Chocolatey package, use the command:

`Get-ChocolateyPackageSource "vlc" | Write-Host`

To prevent the downloaded package files from being cleaned up, pass `$true` to the command as well: 

`Get-ChocolateyPackageSource "vlc" $true | Write-Host`

# Installation

Clone the code anywhere. In Powershell, write:

`Import-Module "<path-to-cloned-directory>/chocolateySourceExtensions.psm1"`