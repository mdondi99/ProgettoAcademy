<# 
 .Synopsis
  Install an App in a NAV/BC Container
 .Parameter containerName
  Name of the container for which you want to install the App
 .Parameter appFolder
  Name of the app to install, it is the name of the App folder f.e. base
 .Example
  App-Install -containerName bctest -appName base
#>
Param(
    [Parameter(Mandatory=$true)]
    [string] $containerName,

    [Parameter(Mandatory=$true)]
    [string] $appFolder
)

$projectRoot = (Get-Item (Join-Path $PSScriptRoot "..")).FullName
$appFolderName = Join-Path $projectRoot $appFolder
$appJson = Get-Content (Join-Path $appFolderName "app.json") | ConvertFrom-Json

$publisher = $appJson.publisher
$appName = $appJson.name
$appVersion = $appJson.version
$appFile = "${publisher}_${appName}_${appVersion}.app"

Publish-BcContainerApp `
    -containername $containerName `
    -appFile $appFile `
    -skipVerification

Sync-BcContainerApp `
    -containerName $containerName `
    -appName $appName `
    -appVersion $appVersion `
    -Mode Add

$prevExt = Get-BCContainerAppInfo -containerName $containerName | Where-Object { $_.Name -eq $appJson.name } | Sort-Object -Property Version | Select-Object -Last 1
if ($null -ne $prevExt) {
    Start-BcContainerAppDataUpgrade `
        -containerName $containerName `
        -appName $appName `
        -appVersion $appVersion
}
else {
    Install-BcContainerApp `
    -containerName $containerName `
    -appName $appName `
    -appVersion $appVersion
}
