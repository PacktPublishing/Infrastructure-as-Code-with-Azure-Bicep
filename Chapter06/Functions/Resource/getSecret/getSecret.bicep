param kvName string
param sqlServerName string
param adminLogin string

resource kv 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: kvName
}

module sql './sql.bicep' = {
  name: 'deploySQL'
  params: {
    sqlServerName: sqlServerName
    adminLogin: adminLogin
    adminPassword: kv.getSecret('vmAdminPassword')
  }
}
