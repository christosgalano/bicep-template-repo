# Sample Module

## Description

This is a sample module to demonstrate the intended structure and usage.

Regarding the metadata part, the fields are:
- **name:** Used for markdown page title.
- **description:** Used as a detailed description for the markdown page.


## Parameters

| Name | Type | Description | Default |
| --- | --- | --- | --- |
| location | string | The Azure region to deploy to. | [resourceGroup().location] |
| optional_param_1 | string | Optional parameter 1. |  |
| optional_param_2 | string | Optional parameter 2. |  |
| required_param | string | Required parameter. |  |
| tags | object | Tags to be applied to resources. | {} |
