param sqlServerName string
param sqlDatabaseName string
param location string = 'australiasoutheast'
param DbAdmins string
param tenantId string
param adminPassword string


resource sqlServer 'Microsoft.Sql/servers@2021-11-01-preview' = {
  name: sqlServerName
  location: location
  properties:{
    administratorLogin: 'sysadmin'
    administratorLoginPassword: adminPassword
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
    minimalTlsVersion: '1.2'
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-11-01-preview' = {
  name: '${sqlServerName}/${sqlDatabaseName}'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  dependsOn: [
    sqlServer
  ]
}

resource sqlServerAdmin 'Microsoft.Sql/servers/administrators@2021-11-01-preview' = {
  parent: sqlServer
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: 'DbAdmins'
    sid: DbAdmins
    tenantId: tenantId
  }
}
