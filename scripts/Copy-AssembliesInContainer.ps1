<# 
 .Synopsis
  Copies .net assemblies inside a container.
 .Description
  Copies all the .net assemblies from the current project inside the container. The .net assemblies
  should be located inside the folder ".netpackages" on the root folder of the project.
 .Parameter containerName
  Name of the container for which you want to install Smeagol.
 .Parameter serverInstance
  Name of the server instance inside the container
 .Example
  Copy-AssembliesInContainer -containerName bctest
#>
Param(
    [Parameter(Mandatory=$true)]
    [string] $containerName,

    [Parameter(Mandatory=$false)]
    [string] $serverInstance = "BC"
)

$serviceAddinFolder = Invoke-ScriptInBcContainer -containerName $containerName -ScriptBlock{
    (Get-Item "C:\Program Files\Microsoft*\*\Service\Add-ins").FullName
}
Write-Host "Service Add-in folder: $($serviceAddinFolder)"

$filesCopied = $false
Get-ChildItem -Path ".." -Recurse -Filter ".netpackages" -Directory -ErrorAction SilentlyContinue | ForEach-Object {
    $dotnetPackages = $_.FullName
    Write-Host "Check .net packages in: $($dotnetPackages)"

    Get-ChildItem -Path $dotnetPackages -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
        $absolutePath = $_.FullName
        $relativePath = $absolutePath.Remove(0,$dotnetPackages.Length)
        $containerPath = Join-Path $serviceAddinFolder $relativePath
        Copy-FileToBcContainer -containerName $containerName -localPath $absolutePath -containerPath $containerPath
        $filesCopied = $true
    }
}

if ($filesCopied) {
    Write-Host "Restart the server instance: $($serverInstance)"
    Invoke-ScriptInBcContainer -containerName $containerName -ScriptBlock{
        Set-NAVServerInstance -ServerInstance $serverInstance -Restart
    }
    Write-Host -ForegroundColor Green "Assembly files copied with success."
}
else {
    Write-Host -ForegroundColor Yellow "No assembly files to copy."
}
