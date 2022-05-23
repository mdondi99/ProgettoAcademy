<# 
 .Synopsis
  Install Smeagol.
 .Description
  Installs Smeagol remote service inside a container, the script must be called by an user
  with administrator rights.
 .Parameter containerName
  Name of the container for which you want to install Smeagol.
 .Example
  Install-Smeagol -containerName bctest
#>
Param(
    [Parameter(Mandatory=$true)]
    [string] $containerName
)

$outputFile = "$PSScriptRoot\NVT.Remote.Service.zip"

if (!(Test-Path -Path $outputFile)) {
    $smeagolServiceUrl = "https://portal.eos-solutions.it/Labs/Downloads/Smeagol/NVT.Remote.Service.zip"
    Write-Host "Download $smeagolServiceUrl"
    # Invoke-WebRequest -Uri $smeagolServiceUrl -OutFile $outputFile -UseDefaultCredentials:$true
    if ($ENV:USERDOMAIN) {
        $userName = "$ENV:USERDOMAIN\$ENV:USERNAME"
    } 
    else {
        $userName = $ENV:USERNAME
    }
    Invoke-WebRequest -Uri $smeagolServiceUrl -OutFile $outputFile -Credential (Get-Credential -UserName $userName -Message "Login on EOS-Portal ...")
}

Write-Host "Copy $outputFile to container $containerName"
$containerId = Get-BCContainerId -containerName $containerName
$session = New-PSSession -ContainerId $containerId -RunAsAdministrator
Copy-Item $outputFile -Destination "C:\Run\Smeagol.Service.zip" -ToSession $session -Force

Write-Host "Install and start service NvtRemoteService."
Invoke-Command -Session $session -ScriptBlock {
    Expand-Archive "C:\Run\Smeagol.Service.zip" -DestinationPath "C:\Run\SmeagolService" -Force
    # . "C:\Run\SmeagolService\NVT.Remote.Service.exe" install
    New-Service -Name "NvtRemoteService" -BinaryPathName "C:\Run\SmeagolService\NVT.Remote.Service.exe" -StartupType Automatic
    Start-Service "NvtRemoteService"
}
