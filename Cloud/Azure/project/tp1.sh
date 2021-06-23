#!/bin/bash

PREFIX=tp1-apalpant
RESOURCE_GROUP=$PREFIX-rg
VNET=$PREFIX-vnet
SUBNET=$PREFIX-subnet0
NIC=$PREFIX-nic0
NSG=$PREFIX-sg
VM=$PREFIX-vm
PIP=$PREFIX-pip

# Create a resource group.
az group create \
	--name $RESOURCE_GROUP \
	--location francecentral

# Check if group is created.
# az group list --query "[?name=='$RESOURCE_GROUP']"

# Create a virtual network.
az network vnet create \
	--resource-group $RESOURCE_GROUP \
	--name $VNET \
	--address-prefixes 10.42.0.0/20 \
	--subnet-name $SUBNET \
	--subnet-prefixes 10.42.0.0/24

# Create a public IP address.
az network public-ip create --resource-group $RESOURCE_GROUP --name $PIP

# Create a network security group.
az network nsg create \
	--resource-group $RESOURCE_GROUP \
	--name $NSG

# Create a virtual network card and associate with a public IP address and NSG.
az network nic create \
	--resource-group $RESOURCE_GROUP \
	--name $NIC \
	--vnet-name $VNET \
	--subnet $SUBNET \
	--network-security-group $NSG \
	--public-ip-address $PIP \
	--accelerated-networking false

# Create VM
az vm create \
	--resource-group $RESOURCE_GROUP \
	--name $VM \
	--nics $NIC \
	--image ubuntults \
	--public-ip-address-dns-name tp1-apalpant-dns \
	--generate-ssh-keys \
	--size Standard_DS1_v2 \
	--custom-data cloud_init.yml

IP=$(az vm list-ip-addresses --resource-group $RESOURCE_GROUP --name $VM --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv)

echo $IP

# Open port 80 and 22 to allow ssh and http traffic to host.
az vm open-port --port 80,22 --resource-group $RESOURCE_GROUP --name $VM --priority 100

## Connect to your Azure VM
# ssh -i ~/.ssh/id_rsa vagrant@$IP

## Cleanup
# az group delete --name $RESOURCE_GROUP