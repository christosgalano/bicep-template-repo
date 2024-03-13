targetScope = 'subscription'

/// Metadata ///
metadata name = 'Sample Stack'
metadata description = '''
This is a sample stack definition. Stacks are not meant to be deployed directly, but rather to be used as a template for creating deployments.

For example if you have two environments (development and production) and they resources that they create are the same, then instead of having to redefine the resources in each environment, you can create a stack for the resources and then use the stack in each environment.

So in this example, you would create a stack for the resources and then use the stack in the development and production environments. This way, if you need to make a change to the resources, you only need to make the change in one place and it will be reflected in both environments.

At the same time the configuration of the resources can be different in each environment, so you can use parameters to pass in the environment specific configuration.
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
@sys.description('Name of the workload\'s environment.')
param environment string = 'prod'

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

/// Modules & Resources ///
@sys.description('Resource group that will contain all resources.')
resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: '${abbreviations.ResourceGroup}-${suffix}'
  tags: tags
  location: location
}

@sys.description('Deploy the sample module.')
module sample '../../modules/sample/main.bicep' = {
  scope: rg
  name: 'sample-stack'
  params: {
    required_param: 'required value'
    optional_param_1: 'optional value 1'
    tags: tags
    location: location
  }
}
