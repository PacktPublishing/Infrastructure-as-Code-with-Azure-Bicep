resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: 'ASP'
  location: resourceGroup().location
  sku: {
    name: 'S1'
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'app${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
  }
  dependsOn: [
    appServicePlan
  ]
}
