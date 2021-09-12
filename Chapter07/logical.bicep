// &&
param isProd bool = true
param numberOfVMs int = 5
output andResultExp bool = isProd && numberOfVMs > 2 // true

// ||
output prodOrMoreThan5Vms bool = isProd || numberOfVMs >= 5 // true

// !
output lessThan5VM bool = !(numberOfVMs > 5) // true

// ??
param properties object = {
  isProd: false
  numberOfProdApps: 10
  numberOfNonProdAppsNull: null
  numberOfNonProdApps: 4
}

output notNullNumber int = properties.numberOfNonProdAppsNull ?? properties.numberOfProdApps ?? properties.isProd // 10

// ?:
param storageAccountName string
param replicateGlobally bool

resource myStorageAccount 'Microsoft.Storage/storageAccounts@2017-10-01' = {
  name: storageAccountName
  location: resourceGroup().location
  properties: {
    accessTier: 'Hot'
  }
  kind: 'StorageV2'
  sku: {
    name: replicateGlobally ? 'Standard_GRS' : 'Standard_LRS'
  }
}
