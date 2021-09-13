@allowed([
  'Dynamic'
  'Static'
])
param allocMethod string = 'Dynamic'
param location string

resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2019-11-01' = {
  name: 'name'
  location: location
  properties: {
    publicIPAllocationMethod: allocMethod
  }
}

output resourceID string = publicIPAddress.id
