targetScope = 'subscription'

/// Metadata ///
metadata name = 'Sample - Production'
metadata summary = 'Deployment of a sample workload in the production environment.'
metadata description = '''
This is a sample deployment of a workload in the production environment.
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
  'prod'
  'production'
])
@sys.description('Name of the workload\'s environment.')
param environment string = 'prod'

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

/// Modules & Resources ///
@sys.description('Resource group that will contain all resources.')
resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: '${abbreviations.ResourceGroup}-${suffix}'
  location: location
}

@sys.description('Deploy the sample module.')
module sample '../../modules/sample/main.bicep' = {
  scope: rg
  name: 'sample-deployment'
  params: {
    required_param: 'required value'
    optional_param_1: 'optional value 1'
    location: location
  }
}
