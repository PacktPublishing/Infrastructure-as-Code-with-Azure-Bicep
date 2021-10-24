resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' existing = {
  name: 'myStorage'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-02-01' = {
  name: '${stg.name}/default/mycontainer'
  properties: {
    denyEncryptionScopeOverride: true
    defaultEncryptionScope: '$account-encryption-key'
    publicAccess: 'None'
    metadata: {}
  }
}
