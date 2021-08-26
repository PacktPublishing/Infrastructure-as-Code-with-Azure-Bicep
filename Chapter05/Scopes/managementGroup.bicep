targetScope = 'managementGroup'

resource parentMG 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: 'parentGroup'
  scope: tenant()
}

resource newMG 'Microsoft.Management/managementGroups@2020-05-01' = {
  scope: tenant()
  name: 'childGroup'
  properties: {
    details: {
      parent: {
        id: parentMG.id
      }
    }
  }
}
