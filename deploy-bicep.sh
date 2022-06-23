#!/bin/bash 

echo "========= Azure Script Deployment ========="
echo "Please beware that you need to follow instruction before use this script."
echo ''
echo "Deploying Bicep Database Infrastructure...."

# Deploying bicep file
az deployment sub create `
    --location $location `
    --template-file $template `
    --parameters resourceGroupName=$resourceGroupName resourceGroupLocation=$location

# Showing group 

az group show --name $resourceGroupName

