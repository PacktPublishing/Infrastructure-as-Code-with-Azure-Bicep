resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'myStorageAccount'
  location: 'eastus'
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: true
    supportsHttpsTrafficOnly: true
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: [
        {
          id: 'SUBNET ID'
          action: 'Allow'
        }
      ]
    }
  }
  tags: {
    'Environment': 'Dev'
    'Project': 'Azure Bicep'
  }
  identity: {
    type: 'SystemAssigned'
  }
}
