# Sample - Development

This is a sample deployment of a workload in the development environment.


## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
location       | Yes      | Azure region used for the deployment of all resources.
workload       | Yes      | Name of the workload that will be deployed.
environment    | No       | Name of the workload's environment.
tags           | No       | Tags to be applied to all resources.

### location

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Azure region used for the deployment of all resources.

### workload

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the workload that will be deployed.

### environment

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Name of the workload's environment.

- Default value: `dev`

- Allowed values: `dev`, `development`

### tags

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Tags to be applied to all resources.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "bicep/environments/development/main.json"
    },
    "parameters": {
        "location": {
            "value": ""
        },
        "workload": {
            "value": ""
        },
        "environment": {
            "value": "dev"
        },
        "tags": {
            "value": {}
        }
    }
}
```
