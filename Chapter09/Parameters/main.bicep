param namePrefix string
param location string = resourceGroup().location
@allowed([
  'Standard_LRS'
  'Premium_LRS'
])
param sku string = 'Premium_LRS'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: '${namePrefix}stg${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
