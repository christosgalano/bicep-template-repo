targetScope = 'resourceGroup'

/// Metadata ///
metadata name = 'Sample Module'
metadata description = '''
This is a sample module to demonstrate the intended structure and usage.

Regarding the metadata part, the fields are:
- **name:** Used for markdown page title.
- **description:** Used as a detailed description for the markdown page.
'''

/// Parameters ///
@sys.description('Required parameter.')
#disable-next-line no-unused-params
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

@sys.description('Tags to be applied to resources.')
#disable-next-line no-unused-params
param tags object = {}
