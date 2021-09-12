// NOT
param isProd bool = false

var shouldNotDeployFirewall = !isProd
output firewallNotDeployed bool = shouldNotDeployFirewall // true

// Minus
param negInt int = -20
output posOutput int = -negInt // 20
