param appServiceAppName string = 'toy-product-launch-app'
param location string = resourceGroup().location

var appServicePlanName = 'toy-product-launch-plan'

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'toylaunchstoragetwo'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverFarms@2020-06-01' = {
  name: appServicePlanName
  location: 'eastus'
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2020-06-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
