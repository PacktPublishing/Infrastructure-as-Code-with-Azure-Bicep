resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'myStorage'
  location: 'eastus'
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

resource azureFunction 'Microsoft.Web/sites@2020-12-01' = {
  name: 'name'
  location: 'eastus'
  kind: 'functionapp'
  properties: {
    serverFarmId: 'serverfarms.id'
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName2;AccountKey=${listKeys(stg.id, stg.apiVersion).key1}'
        }
      ]
    }
  }
}
