metadata description = ''

targetScope = 'subscription'

/// Parameters ///

@description('Azure region used for the deployment of all resources')
param location string

@description('Name of the workload that will be deployed')
param workload string

@description('Name of the workload\'s environment')
param environment string

/// Variables ///

// Load abbreviations for resource names
#disable-next-line no-unused-vars
var abbreviations = sys.loadJsonContent('abbreviations.json')

// Generate a unique token to be used in naming resources
#disable-next-line no-unused-vars
var resource_token = toLower(uniqueString(subscription().id, workload, location))

// Suffix to be used in naming resources
#disable-next-line no-unused-vars
var suffix = '${workload}-${environment}-${location}'

// Unique suffix to be used in naming resources
#disable-next-line no-unused-vars
var unique_suffix = '${suffix}-${resource_token}'

// Resource group name
var resource_group_name = '${abbreviations.ResourceGroup}-${suffix}'

/// Modules & Resources ///

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resource_group_name
  location: location
}

module webapp 'modules/webapp.bicep' = {
  scope: resourceGroup(resource_group_name)

  name: 'webapp-deployment'
  params: {
    location: location
    plan_name: '${abbreviations.AppServicePlan}-${suffix}'
    webapp_name: '${abbreviations.WebApp}-${suffix}'
  }
}

/// Outputs ///
