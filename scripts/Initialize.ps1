<# 
 .Synopsis
  Initialize the settings.
 .Description
  Reads the settings.json file with the settings to create a local container.
#>

$projectRoot = (Get-Item (Join-Path $PSScriptRoot "..")).FullName
$settings = (Get-Content (Join-Path $projectRoot "scripts\settings.json") | ConvertFrom-Json)

$projectName = $settings.name;
if (!($projectName)) {
    throw "No project name for `$projectName` in settings.json."
}
if ($projectName -eq "SET_IT") {
    throw "Set the `$name` in settings.json."
}
if ($projectName.Length -ge 4)
{
    # comment this exception if needed.
    throw "The length of the `$projectName` should not exceed 3 characters."
}

$workspaceFolder = (Get-Item (Join-Path $PSScriptRoot "..")).FullName
$configFolder = (Get-Item (Join-Path $workspaceFolder "config")).FullName
$sharedFolder = (Get-Item (Join-Path $workspaceFolder "config/share")).FullName
