/// Metadata ///
metadata description = 'Tests for the sample module.'

/// Parameters ///
@description('Configures the location to deploy the Azure resources.')
param location string = resourceGroup().location

/// Modules ///
@sys.description('Test with only required parameters.')
module test_required_params '../main.bicep' = {
  name: 'test_required_params'
  params: {
    required_param: 'sample-value'
    location: location
  }
}

@sys.description('Test with optional parameter 1.')
module test_optional_param_1 '../main.bicep' = {
  name: 'test_optional_param_1'
  params: {
    required_param: 'sample-value'
    optional_param_1: 'sample-value'
    location: location
  }
}

@sys.description('Test with all parameters.')
module test_all_params '../main.bicep' = {
  name: 'test_all_params'
  params: {
    required_param: 'sample-value'
    optional_param_1: 'sample-value'
    optional_param_2: 'sample-value'
    location: location
  }
}
