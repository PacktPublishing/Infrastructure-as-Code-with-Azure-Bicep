resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'myStorage${uniqueString(resourceGroup().id)}'
  location: 'eastus'
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

resource serverFarm 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'ASP'
  location: resourceGroup().location
  sku: {
    name: 'S1'
  }
}

resource azureFunction 'Microsoft.Web/sites@2020-12-01' = {
  name: 'name'
  location: 'eastus'
  kind: 'functionapp'
  properties: {
    serverFarmId: serverFarm.id
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName2;AccountKey=${listKeys(stg.id, stg.apiVersion).keys[0].value}'
        }
      ]
    }
  }
}
