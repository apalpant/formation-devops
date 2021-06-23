#!/bin/bash

# Create a resource group.
az group create \
	--name tp1-apalpant-rg \
	--location francecentral

# Check if group is created.
az group list

# Create a virtual network.
# az network vnet create --resource-group tp1-apalpant-rg --name tp1-apalpant-vnet --address-prefixes 10.42.0.0/20 --subnet-name tp1-apalpant-subnet0 --subnet-prefixes 10.42.0.0/24

# Create a public IP address.
# az network public-ip create --resource-group tp1-apalpant-rg --name tp1-apalpant-ip

# Create a network security group.
# az network nsg create --resource-group tp1-apalpant-rg --name tp1-apalpant-sg

# Create a virtual network card and associate with a public IP address and NSG.
# az network nic create --resource-group tp1-apalpant-rg --name tp1-apalpant-nic0 --vnet-name tp1-apalpant-vnet --subnet tp1-apalpant-subnet0 --network-security-group tp1-apalpant-sg --public-ip-address tp1-apalpant-ip

# Create VM
# az vm create --resource-group tp1-apalpant-rg --name tp1-apalpant-vm --nics tp1-apalpant-nic0 --image ubuntults --public-ip-address-dns-name tp1-apalpant-dns --generate-ssh-keys --size Standard_DS1_v2 --accelerated-networking false

# Open port 22 to allow SSh traffic to host.
# az vm open-port --port 22 --resource-group tp1-apalpant-rg --name tp1-apalpant-vm

## Connect to your Azure VM
# ssh -i C:\Users\ib\.ssh\id_rsa ib@20.199.124.139

## Cleanup
# az group delete --name tp1-apalpant-rg