// index
param storageProperties object = {
  storageReplication: 1
}

param supportedReplications array = [
  'Standard_GRS'
  'Standard_LRS'
]

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'name'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: supportedReplications[storageProperties['storageReplication']]
  }
}

// getSecret
param subscriptionId string
param kvResourceGroup string
resource kv 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: 'keyvaultname'
  scope: resourceGroup(subscriptionId, kvResourceGroup)
}

module sql './sql.bicep' = {
  name: 'deploySQL'
  params: {
    sqlServerName: 'sqlServerName'
    adminLogin: 'adminLogin'
    adminPassword: kv.getSecret('vmAdminPassword')
  }
}

// listKeys
output storageKey string = stg.listKeys().key[0].value

// nested accessor
resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'examplestorage'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }

  resource service 'fileServices' = {
    name: 'default'

    resource fileShare 'shares' = {
      name: 'fileshare'
      properties: {
        metadata: {
          parentName: storage.name
        }
      }
    }
  }
}

output fileShareName string = storage::service::fileShare.name

// property accessor
output storageName string = storage.name

// nested property accessor
resource publicIp 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: 'pip'
  location: resourceGroup().location
  properties: {
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: 'label'
    }
  }
}

output ipFqdn string = publicIp.properties.dnsSettings.fqdn
