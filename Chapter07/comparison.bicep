// >=
param appServiceCount int = 2
var shouldCreateScaling = appServiceCount >= 2

output appScalingEnabled bool = shouldCreateScaling // true

// >
param appServicePlanCount int = 3
var moreThanOne = appServicePlanCount > 1

output moreThanOneAppPlan bool = moreThanOne // false

// <=
param numOfVms int = 10

var lessThan10Vms = numOfVms < 10
output wasIt9Vms bool = lessThan10Vms // false

// <
param demo string = 'demo'
param Demo string = 'Demo'

output capitalCase bool = demo < Demo // true

// <=
param memory int = 16
output lowMemory bool = memory <= 16 // true

// == 
param numOfRules int = 1
output onlyOneRule bool = numOfRules == 1 // true

// !=
output moreThanOneRule bool = numOfRules != 1 // true

// =~
param envName string = 'prod'
param currentEnvironment string = 'PROD'

output sameEnvironment bool = envName =~ currentEnvironment // true
