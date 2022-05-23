<# 
 .Synopsis
  Uninstall an App in a NAV/BC Container
 .Parameter containerName
  Name of the container for which you want to uninstall the App
 .Parameter appFolder
  Name of the app to install, it is the name of the App folder f.e. base
 .Example
  App-Uninstall -containerName bctest -appFolder base
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

$appName = $appJson.name
$appVersion = $appJson.version

UnInstall-BcContainerApp `
    -containerName $containerName `
    -appName $appName `
    -appVersion $appVersion

UnPublish-BcContainerApp `
    -containername $containerName `
    -appName $appName `
    -version $appVersion
