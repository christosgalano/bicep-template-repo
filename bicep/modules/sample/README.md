# Sample

Summary describing the Bicep template.

Sample module to demonstrate the inteded structure and usage.

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
required_param | Yes      | Required parameter.
location       | No       | The Azure region to deploy to.
optional_param_1 | No       | Optional parameter 1.
optional_param_2 | No       | Optional parameter 2.

### required_param

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Required parameter.

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The Azure region to deploy to.

- Default value: `[resourceGroup().location]`

### optional_param_1

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Optional parameter 1.

### optional_param_2

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Optional parameter 2.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "bicep/modules/sample/main.json"
    },
    "parameters": {
        "required_param": {
            "value": ""
        },
        "location": {
            "value": "[resourceGroup().location]"
        },
        "optional_param_1": {
            "value": ""
        },
        "optional_param_2": {
            "value": ""
        }
    }
}
```
