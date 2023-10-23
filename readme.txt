create bicep file
Set-Location -Path <path to root directory of bicep file>
Connect-AzAccount
$context= (Get-AzSubscription -SubscriptionName 'Concierge Subscription')
Set-AzContext $context
Set-AzDefault -ResourceGroupName learn-f1f3ace7-88e6-447d-8b3f-2c3811cb0da0
New-AzResourceGroupDeployment -TemplateFile main.bicep
Get-AzResourceGroupDeployment -ResourceGroupName learn-f1f3ace7-88e6-447d-8b3f-2c3811cb0da0 | Format-Table
learn-f1f3ace7-88e6-447d-8b3f-2c3811cb0da0
make changes in bicep file and then repeat step on line no <07>