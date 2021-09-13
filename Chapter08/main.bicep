param namePrefix string = 'stg'
param location string = resourceGroup().location

module stgModule './storagemodule.bicep' = {
  name: 'storageDeploy'
  params: {
    storagePrefix: namePrefix
    location: location
  }
}

output storageEndpoint object = stgModule.outputs.storageEndpoint

// conditionally deploy
param deployStorage bool

module storageAcc './storagemodule.bicep' = if (deployStorage) {
  name: 'myZoneModule'
  params: {
    storagePrefix: namePrefix
    location: location
  }
}

// separate scope
param scopeLocation string
param resourceGroupName string
module scopedMod './storagemodule.bicep' = {
  name: 'myScopedModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    storagePrefix: namePrefix
    location: scopeLocation
  }
}
