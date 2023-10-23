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

define parameters location, storageAccountName,appServiceName,environmentType all with default 
    value except the last one with allowed values of ('nonprod','prod')
    use expressions, string interpolation wherever possible, e.g uniqueString(resourceGroup().id), 
define variables appServicePlanName,and for SKUs of storage & app service plan
enter the defined params & variables in resource definitions.
again make a deployment with environmentType parameter
New-AzResourceGroupDeployment -TemplateFile main.bicep -environmentType nonprod

create a new modules/appService.bicep file
write code to deploy appService resources i.e appserviceplan & appserviceapp
and the end add line
output appServiceAppHostName string= appServiceApp.properties.defaultHostName
back to main.bicep and remove code that did the same thing that no app.bicep is doing
and instead write code to reference this module file now.
at the end add the line
output appServiceHostName string=appServiceModule.outputs.appServiceAppHostName

redo step mentioned on line #17
New-AzResourceGroupDeployment -TemplateFile main.bicep -environmentType nonprod

