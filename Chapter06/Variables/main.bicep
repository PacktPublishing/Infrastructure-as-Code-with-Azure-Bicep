param rgLocation string = resourceGroup().location
param environmentName string = 'prod'

var storageName = '${environmentName}${uniqueString(resourceGroup().id)}sa'
resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: rgLocation
  kind: 'Storage'
  sku: {
    name: 'Standard_LRS'
  }
}
