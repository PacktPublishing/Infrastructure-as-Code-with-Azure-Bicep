param namePrefix string = 'stg'
param location string = resourceGroup().location
// loop with array

param storageAccArray array = [
  {
    name: 'stgDeployment1'
    prefix: 'stg1'
  }
  {
    name: 'stgDeployment1'
    prefix: 'stg2'
  }
]
module storageAccs './storagemodule.bicep' = [for stg in storageAccArray: {
  name: stg.name
  params: {
    storagePrefix: stg.prefix
    location: location
  }
}]

// loop with index
module stgModule './storagemodule.bicep' = [for i in range(0, 2): {
  name: 'storageDeploy${i}'
  params: {
    storagePrefix: namePrefix
    location: location
  }
}]

// loop with index and array
module stgModules './storagemodule.bicep' = [for (stg, index) in storageAccArray: {
  name: 'storageDeploy${index}'
  params: {
    storagePrefix: stg.prefix
    location: location
  }
}]
