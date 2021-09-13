resource pip 'Microsoft.Network/publicIPAddresses@2019-11-01' = {
  name: 'name'
  location: resourceGroup().location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    dnsSettings: {
      domainNameLabel: 'dnsname'
    }
  }
}

output fqdn string = pip.properties.dnsSettings.fqdn

// hyphen in the name
param storageProps object = {
  'storage-name': 'myStorageName'
}

output storageName string = storageProps['storage-name']

// using function
output location string = resourceGroup().location
output rgTags int = length(resourceGroup().tags)
output isProd bool = environment().name == 'prod'
output audiences array = environment().authentication.audiences
output sub object = subscription()

// conditional
param shouldDeploy bool = false
resource publicIP 'Microsoft.Network/publicIPAddresses@2019-11-01' = if (shouldDeploy) {
  name: 'pip'
  location: resourceGroup().location
}

output domainName string = shouldDeploy ? publicIP.properties.dnsSettings.fqdn : ''

// loop and outputs
param pipLocation string = resourceGroup().location
param publicIPs array = [
  'pip1'
  'pip2'
  'pip3'
]

resource publicIPAdds 'Microsoft.Network/publicIPAddresses@2019-11-01' = [for name in publicIPs: {
  name: name
  location: pipLocation
}]

output fqdns array = [for (name, i) in publicIPs: {
  name: publicIPs[i]
  fqdn: publicIPAdds[i].properties.dnsSettings.fqdn
}]

// module output
param stgLocation string = resourceGroup().location

module stgAcc './storagemodule.bicep' = {
  name: 'stgModule'
  params: {
    location: stgLocation
    storagePrefix: 'stg'
    storageSKU: 'Standard_LRS'
  }
}

output storageEndpoint object = stgAcc.outputs.storageEndpoint

// using output to pupulate properties
module pipMod './publicip.bicep' = {
  name: 'pipModule'
  params: {
    allocMethod: 'Static'
    location: pipLocation
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'name'
  location: pipLocation
  properties: {
    ipConfigurations: [
      {
        name: 'name'
        properties: {
          publicIPAddress: {
            id: pipMod.outputs.resourceID
          }
        }
      }
    ]
  }
}
