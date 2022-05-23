<# 
 .Synopsis
  Creates a local container.
 .Description
  The parameters to create the local container are read from the settings.json file,
  it contains the container name and the artifact to use.
 .Parameter containerName
  Name of the container to create.
 .Example
  Create-Container -containerName bctest
#>
Param(
  [Parameter(Mandatory=$false)]
  [string] $containerName = ""
)

Set-Location $PSScriptRoot
. ".\Initialize.ps1"

$imageName = $settings.container.imageName
$artifact = $settings.container.artifact
if (!($containerName)) {
    $containerName = $settings.container.name
    if (!($containerName)) {
        $containerName = $settings.name.ToLower()
    }
}

$parameters = @{
    "accept_eula" = $true
    "accept_outdated" = $true
}

if ($imageName -ne "") {
    Write-Host "Image: $imageName"
    $parameters += @{ "imageName" = $imageName }
}

$additionalParameters = @("--volume ""${sharedFolder}:C:\Source""") 

if ($artifact -like 'https://*') {
    $artifactUrl = $artifact
    # TODO: add insider SaaS token when it is needed.
}
else {
    $segments = "$artifact/////".Split('/')
    $artifactUrl = Get-BCArtifactUrl -storageAccount $segments[0] -type $segments[1] -version $segments[2] -country $segments[3] -select $segments[4] -sasToken $env:InsiderSasToken | Select-Object -First 1
    if (-not ($artifactUrl)) {
        throw "Unable to locate artifactUrl from $artifact"
    }
}

$useBestContainerOS = $settings.container.useBestContainerOS
if (!($useBestContainerOS)) {
    $useBestContainerOS = $false
}

$includeTestToolkit = $settings.container.includeTestToolkit
if (!($includeTestToolkit)) {
    $includeTestToolkit = $false
}

$includeTestLibrariesOnly = $settings.container.includeTestLibrariesOnly
if (!($includeTestLibrariesOnly)) {
    $includeTestLibrariesOnly = $false
}

$licenseFile = $settings.container.licenseFile
if ($licenseFile) {
    $licenseFile = (Get-Item (Join-Path $configFolder $licenseFile)).FullName
    $parameters += @{
        "licenseFile" = $licenseFile
    }
}

$bakFile = $settings.container.databaseRestoreFile
if ($bakFile) {
    if (!($bakFile.StartsWith("http://", [StringComparison]::OrdinalIgnoreCase)) -and !($bakFile.StartsWith("https://", [StringComparison]::OrdinalIgnoreCase))) {
        $bakFile = (Get-Item (Join-Path $sharedFolder $bakFile)).FullName
        $parameters += @{
            "bakFile" = $bakFile
        }
    }
    Write-Host $bakFile
}

New-BCContainer `
    @parameters `
    -doNotCheckHealth `
    -containerName $containerName `
    -artifactUrl $artifactUrl `
    -useBestContainerOS:$useBestContainerOS `
    -auth NavUserPassword `
    -assignPremiumPlan `
    -updateHosts `
    -additionalParameters $additionalParameters `
    -includeTestToolkit:$includeTestToolkit `
    -includeTestLibrariesOnly:$includeTestLibrariesOnly `
    -doNotUseRuntimePackages `
    -enableTaskScheduler:$false `
    -dns 8.8.8.8
