# Sample - Development

## Description

This is a sample deployment of a workload in the development environment.


## Modules

| Symbolic Name | Source | Description |
| --- | --- | --- |
| sample | ../../modules/sample/main.bicep | Deploy the sample module. |

## Resources

| Symbolic Name | Type | Description |
| --- | --- | --- |
| rg | [Microsoft.Resources/resourceGroups](https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups) | Resource group that will contain all resources. |

## Parameters

| Name | Type | Description | Default |
| --- | --- | --- | --- |
| environment | string | Name of the workload's environment. | dev |
| location | string | Azure region used for the deployment of all resources. |  |
| tags | object | Tags to be applied to all resources. | {} |
| workload | string | Name of the workload that will be deployed. |  |

## Variables

| Name | Description |
| --- | --- |
| abbreviations | |
| resource_token | |
| suffix | |
| unique_suffix | |
