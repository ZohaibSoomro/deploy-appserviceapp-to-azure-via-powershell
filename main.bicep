resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01'={
  name: 'zohaibstorage006'
  location: 'westus3'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}


resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01'={
  name: 'toy-app-service-plan'
  location: 'westus3'
  sku: {
    name:'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01'={
  name:'toyapp006'
  location:'westus3'
  properties:{
    serverFarmId:appServicePlan.id
    httpsOnly:true
  }
}

