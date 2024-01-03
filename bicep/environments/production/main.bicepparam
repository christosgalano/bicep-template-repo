using 'main.bicep'

param location = 'westeurope'

param workload = 'demo'

param environment = 'prod'

param tags = {
  environment: toLower(environment)
  workload: workload
  criticality: 'high'
}
