# Sample Stack

## Description

This is a sample stack definition. Stacks are not meant to be deployed directly, but rather to be used as a template for creating deployments.

For example if you have two environments (development and production) and they resources that they create are the same, then instead of having to redefine the resources in each environment, you can create a stack for the resources and then use the stack in each environment.

So in this example, you would create a stack for the resources and then use the stack in the development and production environments. This way, if you need to make a change to the resources, you only need to make the change in one place and it will be reflected in both environments.

At the same time the configuration of the resources can be different in each environment, so you can use parameters to pass in the environment specific configuration.


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

## Resources

| Symbolic Name | Type | Description |
| --- | --- | --- |
| rg | [Microsoft.Resources/resourceGroups](https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups) | Resource group that will contain all resources. |

## Parameters

| Name | Type | Description | Default |
| --- | --- | --- | --- |
| environment | string | Name of the workload's environment. | "prod" |
| location | string | Azure region used for the deployment of all resources. |  |
| tags | object | Tags to be applied to all resources. | {} |
| workload | string | Name of the workload that will be deployed. |  |

## Variables

| Name | Description |
| --- | --- |
| abbreviations | Abbreviations for resource names. |
| resource_token | Unique token to be used in naming resources. |
| suffix | Suffix to be used in naming resources. |
| unique_suffix | Unique suffix to be used in naming resources. |
