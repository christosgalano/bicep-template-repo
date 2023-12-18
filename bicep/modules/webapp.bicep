@description('Location of the deployed resources')
param location string

@description('App Service Plan name')
param plan_name string

@description('Web App name')
param webapp_name string

resource plan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: plan_name
  location: location
  properties: {
    reserved: true
  }
}

resource webapp 'Microsoft.Web/sites@2023-01-01' = {
  name: webapp_name
  location: location
  properties: {
    serverFarmId: plan.id
    httpsOnly: false
  }
}

output endpoint string = webapp.properties.defaultHostName
