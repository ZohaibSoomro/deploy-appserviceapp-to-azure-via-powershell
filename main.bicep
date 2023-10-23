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
