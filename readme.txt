create bicep file
Set-Location -Path <path to root directory of bicep file>
Connect-AzAccount
$context= (Get-AzSubscription -SubscriptionName 'Concierge Subscription')
Set-AzContext $context
Set-AzDefault -ResourceGroupName learn-f1f3ace7-88e6-447d-8b3f-2c3811cb0da0
New-AzResourceGroupDeployment -TemplateFile main.bicep