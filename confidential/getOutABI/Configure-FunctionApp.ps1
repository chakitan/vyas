<#
    .SYNOPSIS
    Configure-FunctionApp.ps1

    .DESCRIPTION
    * Configure Function App Settings
        1. Add connectionString to app settings
       
    .NOTES
    Change Log: FEB'22 Created
#>

[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $Environment= 'devops'
)


# Pull parameters from file.
Write-Host "`nPulling variables from parameter files."
$apiparameters = Get-Content $PSScriptRoot\parameters\environments\$Environment\api-parameters.json | ConvertFrom-Json
$connectionString= "@Microsoft.KeyVault(SecretUri=https://"+$apiparameters.parameters.vault_name.value+".vault.azure.net/secrets/SqlConnectionString/)"
try {
    az functionapp config appsettings set --name $apiparameters.parameters.functionApp_name.value `
        --resource-group $apiparameters.parameters.resourceGroup_name.value `
        --settings "SqlConnectionString=$connectionString"
    
        //     type: 'SQLAzure'
}
catch {
    
}