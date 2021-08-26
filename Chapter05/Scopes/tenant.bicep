targetScope = 'tenant'

// create resource at tenant
resource mgmg 'Microsoft.Management/managementGroups@2020-02-01' = {
  name: 'myManagementGroup'
}
