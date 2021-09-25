resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'stg${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
