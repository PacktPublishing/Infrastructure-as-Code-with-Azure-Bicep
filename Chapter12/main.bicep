@allowed([
  'Production'
  'NonProduction'
])
param environmentType string = 'NonProduction'

var environmentConfigurationMap = {
  Production: {
    appServicePlan: {
      sku: {
        name: 'P2V3'
        capacity: 3
      }
    }
    appServiceApp: {
      alwaysOn: false
    }
  }
  NonProduction: {
    appServicePlan: {
      sku: {
        name: 'S2'
        capacity: 1
      }
    }
    appServiceApp: {
      alwaysOn: false
    }
  }
}

var sharedNamePrefixes = json(loadTextContent('./variables.json'))

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: '${sharedNamePrefixes.appServicePrefix}-${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: environmentConfigurationMap[environmentType].appServicePlan.sku
}
