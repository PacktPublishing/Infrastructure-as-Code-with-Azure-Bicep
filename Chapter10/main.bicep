param appServicePlanSku string = 'S1'
param appName string = 'bicepdemoapp${uniqueString(resourceGroup().id)}'
param linuxFxVersion string = 'DOTNETCORE|3.0'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'ASPLinux'
  location: resourceGroup().location
  sku: {
    name: appServicePlanSku
  }
  kind: 'linux'
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: appName
  location: resourceGroup().location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
