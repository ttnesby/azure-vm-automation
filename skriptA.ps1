param(
    [string[]]$rgNames
)
# function/commando for creating a resource group

# NB!! Which tenant/subscription
# Torstein use different browsers with different colors for different tenants
# Activate the right browser, then do Connect-AzAccount

# How to define the correct subscription, in case of access to many

## ASSUMPTION - already logged in correct tenant

Set-AzContext -SubscriptionId "4213a5e1-2092-42a5-810b-8cc0fd3fc69e"

foreach ($rgName in $rgNames) {    
    New-AzResourceGroup -Name $rgName -Location "norwayeast"
}

# After completion - remember Disconnect-AzAccount -Scope CurrentUser
