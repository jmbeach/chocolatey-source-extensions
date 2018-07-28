$chocolateyUrl = "https://chocolatey.org/api/v2/package/"
$installPs1FileName = "chocolateyInstall.ps1"
$tempFileContents = "choco-source-viewer-out"

function Format-ChocolateyUrl([string]$packageName) {
    return $chocolateyUrl + $packageName
}

function Get-ChocolateyPackageElements ($data) {
    return $data.ParsedHtml.body.getElementsByClassName($selectorPackageContents)
}

function Get-ChocolateyPackageSource([string]$packageName, [bool]$leaveFiles) {
    $url = Format-ChocolateyUrl $packageName
    $outFile = $packageName + ".zip"
    Invoke-WebRequest -Uri $url -OutFile $outFile
    $command = "7z x $outFile -o" + $tempFileContents
    Invoke-Expression $command | Out-Null
    $installPs1 = $(Get-ChildItem $installPs1FileName -Recurse)[0].FullName
    $result = Get-Content $installPs1
    if (!$leaveFiles) {
        Remove-Item -Force -Recurse $tempFileContents
        Remove-Item -Force -Recurse $outFile
    }

    return $result
}

Export-ModuleMember -Function Get-ChocolateyPackageSource