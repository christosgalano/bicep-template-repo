targetScope = 'subscription'

/// Metadata ///
metadata name = 'Sample - Development'
metadata description = '''
This is a sample deployment of a workload in the development environment.
'''

/// Parameters ///
@metadata({
  strongType: 'location'
})
@sys.description('Azure region used for the deployment of all resources.')
param location string

@maxLength(10)
@minLength(2)
@sys.description('Name of the workload that will be deployed.')
param workload string

@maxLength(12)
@minLength(2)
@allowed([
  'dev'
  'development'
])
@sys.description('Name of the workload\'s environment.')
param environment string = 'dev'

@sys.description('Tags to be applied to all resources.')
param tags object = {}

/// Variables ///
@sys.description('Abbreviations for resource names.')
#disable-next-line no-unused-vars
var abbreviations = sys.loadJsonContent('../../abbreviations.json')

@sys.description('Unique token to be used in naming resources.')
#disable-next-line no-unused-vars
var resource_token = toLower(uniqueString(subscription().id, workload, location))

@sys.description('Suffix to be used in naming resources.')
#disable-next-line no-unused-vars
var suffix = '${workload}-${environment}-${location}'

@sys.description('Unique suffix to be used in naming resources.')
#disable-next-line no-unused-vars
var unique_suffix = '${suffix}-${resource_token}'

/// Solution 1: Modules & Resources ///

// Use this approach if the environments differ significantly in terms of resources.

@sys.description('Resource group that will contain all resources.')
resource rg 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: '${abbreviations.ResourceGroup}-${suffix}'

  tags: tags
  location: location
}

@sys.description('Deploy the sample module.')
module sample '../../modules/sample/main.bicep' = {
  scope: rg
  name: 'sample-deployment'
  params: {
    required_param: 'required value'
    optional_param_1: 'optional value 1'

    tags: tags
    location: location
  }
}

/// Solution 2: Stacks ///

// Use this approach if the environments differ only slightly in terms of resources.

@sys.description('Deploy the sample stack.')
module sample_stack '../../stacks/sample/main.bicep' = {
  scope: subscription()
  name: 'sample-stack'
  params: {
    tags: tags
    location: location
    workload: workload
    environment: environment
  }
}
