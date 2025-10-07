# Sample - Production

## Description

This is a sample deployment of a workload in the production environment.


## Usage

Here is a basic example of how to use this Bicep module:

```bicep
module reference_name 'path_to_module | container_registry_reference' = {
  name: 'deployment_name'
  params: {
    // Required parameters
    location:
    workload:

    // Optional parameters
    environment: 'prod'
    tags: {}
  }
}
```

> Note: In the default values, strings enclosed in square brackets (e.g. '[resourceGroup().location]' or '[__bicep.function_name(args...)']) represent function calls or references.

## Modules

| Symbolic Name | Source | Description |
| --- | --- | --- |
| sample | ../../modules/sample/main.bicep | Deploy the sample module. |
| sample_stack | ../../stacks/sample/main.bicep | Deploy the sample stack. |

## Resources

| Symbolic Name | Type | Description |
| --- | --- | --- |
| rg | [Microsoft.Resources/resourceGroups](https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups) | Resource group that will contain all resources. |

## Parameters

| Name | Status | Type | Description | Default |
| --- | --- | --- | --- | --- |
| environment | Optional | string | Name of the workload's environment. | "prod" |
| location | Required | string | Azure region used for the deployment of all resources. |  |
| tags | Optional | object | Tags to be applied to all resources. | {} |
| workload | Required | string | Name of the workload that will be deployed. |  |

## Variables

| Name | Description |
| --- | --- |
| abbreviations | Abbreviations for resource names. |
| resource_token | Unique token to be used in naming resources. |
| suffix | Suffix to be used in naming resources. |
| unique_suffix | Unique suffix to be used in naming resources. |
