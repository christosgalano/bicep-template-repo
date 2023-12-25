targetScope = 'resourceGroup'

/// Metadata ///
metadata name = 'Sample'
metadata description = 'Sample module to demonstrate the inteded structure and usage.'

/// Parameters ///
@sys.description('Required parameter.')
// #disable-next-line no-unused-params
param required_param string

@metadata({
  strongType: 'location'
})
@sys.description('The Azure region to deploy to.')
#disable-next-line no-unused-params
param location string = resourceGroup().location

@sys.description('Optional parameter 1.')
#disable-next-line no-unused-params
param optional_param_1 string = ''

@sys.description('Optional parameter 2.')
#disable-next-line no-unused-params
param optional_param_2 string = ''
