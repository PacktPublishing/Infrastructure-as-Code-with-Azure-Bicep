// index
param storageCount int = 2
param location string = resourceGroup().location
resource storageAcct 'Microsoft.Storage/storageAccounts@2021-02-01' = [for i in range(0, storageCount): {
  name: '${i}storage${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'Storage'
}]

// array
param storageNames array = [
  'stg1'
  'stg2'
]

resource storageaccounts 'Microsoft.Storage/storageAccounts@2021-02-01' = [for name in storageNames: {
  name: name
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}]

// array and idnex
param storageAccountNamePrefix string
var storageConfigurations = [
  {
    suffix: 'local'
    sku: 'Standard_LRS'
  }
  {
    suffix: 'geo'
    sku: 'Standard_GRS'
  }
]

resource storageAccountResources 'Microsoft.Storage/storageAccounts@2021-02-01' = [for (config, i) in storageConfigurations: {
  name: '${storageAccountNamePrefix}${config.suffix}${i}'
  location: resourceGroup().location
  properties: {
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot'
  }
  kind: 'StorageV2'
  sku: {
    name: config.sku
  }
}]

// property loops
var subnets = [
  {
    name: 'web'
    subnetPrefix: '10.20.0.0/24'
    enabled: true
  }
  {
    name: 'api'
    subnetPrefix: '10.20.1.0/24'
    enabled: false
  }
]

resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = {
  name: 'vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.0.0/20'
      ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
      }
    }]
  }
}

// loops with conditions
param storageAccounts array = [
  {
    name: 'stg1'
    enabled: true
  }
  {
    name: 'stg2'
    enabled: false
  }
]

resource storageAccs 'Microsoft.Storage/storageAccounts@2021-02-01' = [for storage in storageAccounts: if (storage.enabled) {
  name: storage.name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}]

// batching
@batchSize(2)
resource storageAccts 'Microsoft.Storage/storageAccounts@2021-02-01' = [for i in range(0, 4): {
  name: '${i}storage${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'Storage'
}]

// child resource loops
param stgWithBlobs array = [
  {
    name: 'stg1'
    blobServiceName: 'default'
  }
  {
    name: 'stg2'
    blobServiceName: 'default'
  }
]

resource storageWithBlobs 'Microsoft.Storage/storageAccounts@2021-02-01' = [for storage in stgWithBlobs: {
  name: storage.name
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}]

resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = [for (storage, index) in stgWithBlobs: {
  name: storage.blobServiceName
  parent: storageWithBlobs[index]
}]

resource blobs 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = [for index in range(0, length(stgWithBlobs)): {
  name: 'blob${index}'
  parent: blobServices[index]
}]
