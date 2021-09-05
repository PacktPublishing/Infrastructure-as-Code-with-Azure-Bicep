param sqlServerName string
param sbName string = 'myDb'
param adminLogin string

@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' = {
  name: sqlServerName
  location: resourceGroup().location
  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: sbName
  location: resourceGroup().location
  properties: {
    collation: 'collation'
    edition: 'Basic'
    maxSizeBytes: 'maxSizeBytes'
    requestedServiceObjectiveName: 'Basic'
  }
}
