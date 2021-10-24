param principalId string
param roleDefId string = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635' //owner
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-10-01' = {
  name: 'myResourceGroup'
  location: 'eastus'
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid('Owner', principalId, subscription().subscriptionId)

  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefId)
    principalId: principalId
  }
}
