param location string='westus3'
param storageAccountName string='toylaunch${uniqueString(resourceGroup().id)}'
param appServiceAppName string='toylaunch${uniqueString(resourceGroup().id)}'
var appServicePlanName='toy-product-launch-plan'
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var storageAccountSkuName=environmentType=='nonprod'? 'Standard_LRS':'Standard_GRS'
var appServicePlanSkuName=environmentType=='nonprod'? 'F1':'P2v3'

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


resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01'={
  name: appServicePlanName
  location: location
  sku: {
    name:appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01'={
  name:appServiceAppName
  location:location
  properties:{
    serverFarmId:appServicePlan.id
    httpsOnly:true
  }
}

