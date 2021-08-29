@minLength(3)
@maxLength(24)
@description('Name of the storage account')
param storageAccountName string = 'sa${uniqueString(resourceGroup().id)}'

@allowed([
  {
    location: 'Australia Southeast'
    sku: 'Standard_LRS'
  }
  {
    location: 'Australia East'
    sku: 'Standard_ZRS'
  }
])
param storageAccountSettings array

param location string = resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageAccountSettings[0].sku
  }
}
