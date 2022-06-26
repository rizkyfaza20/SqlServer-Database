#!/bin/bash 

resourceGroupName = $resourceGroupName
sqlServerName = $sqlServerName
sqlDatabaseName = $sqlDatabaseName
tenantId = $tenantId
adminPassword = $adminPassword

echo "========= Azure Script Deployment ========="
echo "Please beware that you need to follow instruction before use this script."
echo ""
echo "Deploying Bicep Database Infrastructure...."

# Deploying bicep file
az deployment group create 
    --template-file database.bicep \ 
    --resource-group $resourceGroupName \ 
    --parameters sqlServerName=$sqlServerName sqlDatabaseName=$sqlDatabaseName DbAdmins=sysadmin tenantId=$tenantId adminPassword=$adminPassword

# Showing group 

az group show --name $resourceGroupName

