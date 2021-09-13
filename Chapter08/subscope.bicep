// set the target scope for this file
targetScope = 'subscription'
param location string = deployment().location

resource myResourceGroup 'Microsoft.Resources/resourceGroups@2020-01-01' = {
  name: 'moduleRG'
  location: location
  scope: subscription()
}

module stgModule './storagemodule.bicep' = {
  name: 'storageDeploy'
  scope: myResourceGroup
  params: {
    storagePrefix: 'stg'
    location: location
  }
}
