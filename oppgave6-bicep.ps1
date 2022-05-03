param(
    [string]$subId = "4213a5e1-2092-42a5-810b-8cc0fd3fc69e",
    [string[]]$rgListOfNames = @("rgDemo1"; "rgDemo2")
)

# set correct subscription id - where to deploy resources
Set-AzContext -SubscriptionId $subId

foreach ($rgName in $rgListOfNames) {

    # New-AzDeployment -Name "Deployment1-$rgName" -Location "norwayeast" -TemplateFile "./rg.bicep" -TemplateParameterObject @{rgName = $rgName}    

    #easier way of handle multiple arguments to function
    $params = @{
        Name                    = "resourceGroup-$((Get-Date -Format yyMMdd-HHmmss).ToString())"
        Location                = "norwayeast"
        TemplateFile            = "./rg.bicep"
        TemplateParameterObject = @{rgName = $rgName }
    }
    New-AzDeployment @params


    #New-AzResourceGroup -Name $rgName -Location "norwayeast"
}
