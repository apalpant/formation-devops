#!/bin/bash

PREFIX=tp2-apalpant

TEMPLATE_FILE=template-mine.json
RESOURCE_GROUP=$PREFIX-rg

# Create a resource group.
az group create \
	--name $RESOURCE_GROUP \
	--location francecentral

# Create deployment using template.
az deployment group create \
  --name blanktemplate \
  --resource-group $RESOURCE_GROUP \
  --template-file $TEMPLATE_FILE

## Cleanup
# az group delete --name $RESOURCE_GROUP