resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' existing = {
  name: 'ASP'
  scope: resourceGroup('AZ204')
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: 'name'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
