param storageAccountName string
param location string = resourceGroup().location
param deployZone bool
// condition
resource dnsZone 'Microsoft.Network/dnszones@2018-05-01' = if (deployZone) {
  name: 'myZone'
  location: 'global'
}

// exising or new
@allowed([
  'new'
  'existing'
])
param newOrExisting string = 'new'

resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = if (newOrExisting == 'new') {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

// reference funciton duriong conditional deployment
param serverFarmId string = ''

resource azureFunction 'Microsoft.Web/sites@2020-12-01' = if (!empty(serverFarmId)) {
  name: 'name'
  location: resourceGroup().location
  kind: 'functionapp'
  properties: {
    serverFarmId: ((!empty(serverFarmId)) ? reference(serverFarmId, '2020-12-01').id : json('null'))
  }
}
