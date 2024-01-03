using 'main.bicep'

param location = 'westeurope'

param workload = 'demo'

param environment = 'dev'

param tags = {
  environment: toLower(environment)
  workload: workload
  criticality: 'low'
}
