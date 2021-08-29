@allowed([
  'test'
  'prod'
])
param environmentName string

var environmentSettings = {
  test: {
    appServicePlanSku: 'S1'
    instanceCount: 1
  }
  prod: {
    appServicePlanSku: 'P1'
    instanceCount: 4
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'name'
  location: resourceGroup().location
  sku: {
    name: environmentSettings[environmentName].appServicePlanSku
    capacity: environmentSettings[environmentName].instanceCount
  }
}
