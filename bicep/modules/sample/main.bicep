targetScope = 'resourceGroup'

/// Metadata ///
metadata name = 'Sample'
metadata summary = 'Sample module to demonstrate the inteded structure and usage.'
metadata description = '''
This is a sample module to demonstrate the inteded structure and usage.

Regarding the metadata part, the following fields are required:
- **name:** The display name of the module.
- **summary:** A short summary of the module.

The following fields are optional:
- **description:** A longer description of the module.
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
