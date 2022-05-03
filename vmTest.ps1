param(
    [string]$rgName = 'rgVMDemo'
)

Set-AzContext -SubscriptionId "4213a5e1-2092-42a5-810b-8cc0fd3fc69e"

New-AzResourceGroup -Name $rgName -Location "norwayeast"

$password = ConvertTo-SecureString "MyPlainTextPassword#123" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ("username", $password)

New-AzVM -Name 'torsteinVM' -ResourceGroupName $rgName -Location 'norwayeast' -Credential $Cred -Image "UbuntuLTS"

Write-Host "Finished"


