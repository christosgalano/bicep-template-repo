# Sample Module

## Description

This is a sample module to demonstrate the intended structure and usage.

Regarding the metadata part, the fields are:
- **name:** Used for markdown page title.
- **description:** Used as a detailed description for the markdown page.


## Usage

Here is a basic example of how to use this Bicep module:

```bicep
module reference_name 'path_to_module | container_registry_reference' = {
  name: 'deployment_name'
  params: {
    // Required parameters
    required_param:

    // Optional parameters
    location: '[resourceGroup().location]'
    optional_param_1: ''
    optional_param_2: ''
    tags: {}
  }
}
```

> Note: In the default values, strings enclosed in square brackets (e.g. '[resourceGroup().location]' or '[__bicep.function_name(args...)']) represent function calls or references.

## Parameters

| Name | Status | Type | Description | Default |
| --- | --- | --- | --- | --- |
| location | Optional | string | The Azure region to deploy to. | "[resourceGroup().location]" |
| optional_param_1 | Optional | string | Optional parameter 1. | "" |
| optional_param_2 | Optional | string | Optional parameter 2. | "" |
| required_param | Required | string | Required parameter. |  |
| tags | Optional | object | Tags to be applied to resources. | {} |
