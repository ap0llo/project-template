$ErrorActionPreference = "Stop"

if ($env:TF_BUILD) {
    Write-Host "##[group]Install .NET SDK"
}
# Install .NET 5 runtime (requried for running some of the local tools during build)
./build/dotnet-install.ps1 -Channel 5.0 -Runtime dotnet

# Install SDK and runtime as specified in global.json
./build/dotnet-install.ps1 -JsonFile "$PSScriptRoot/global.json"

Invoke-Expression "dotnet --info"

if ($env:TF_BUILD) {
    Write-Host "##[endgroup]"
}

dotnet run --project build/Build.csproj -- $args
exit $LASTEXITCODE