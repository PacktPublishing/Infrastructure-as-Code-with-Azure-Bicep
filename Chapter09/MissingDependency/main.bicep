resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' existing = {
  name: 'storage'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${stg.name}/default/logs'
}
