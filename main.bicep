param location string='westus3'
param storageAccountName string='toylaunch${uniqueString(resourceGroup().id)}'
param appServiceAppName string='toylaunch${uniqueString(resourceGroup().id)}'
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var storageAccountSkuName=environmentType=='nonprod'? 'Standard_LRS':'Standard_GRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01'={
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}


module appServiceModule 'modules/appservice.bicep'={
  name:'appserviceModule'
  params:{
    location:location
    appServiceAppName:appServiceAppName
    environmentType:environmentType
  }
}

output appServiceAppHostName string= appServiceModule.outputs.appServiceAppHostName
