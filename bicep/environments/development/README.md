# Display name of the template

Summary describing the Bicep template.

Description of the main template.

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
location       | Yes      | Azure region used for the deployment of all resources.
workload       | Yes      | Name of the workload that will be deployed.
environment    | Yes      | Name of the workload's environment.

### location

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Azure region used for the deployment of all resources.

### workload

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the workload that will be deployed.

### environment

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the workload's environment.

- Allowed values: `dev`, `test`, `prod`

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
            "value": ""
        }
    }
}
```
