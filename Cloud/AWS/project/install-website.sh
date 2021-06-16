#!/bin/bash

cidr=172.31.0.0/24
region=eu-west-3

vpcId=`aws ec2 create-vpc \
            --cidr-block $cidr \
            --instance-tenancy default \
            --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=vpc-tp-1}]" \
            --query Vpc.VpcId --output text`

echo 'vpc '$vpcId

subnetId=`aws ec2 create-subnet \
    --vpc-id $vpcId \
    --cidr-block $cidr \
    --query Subnet.SubnetId --output text`

securityGroup=`aws ec2 create-security-group \
                    --group-name my-sg \
                    --description "My security group" \
                    --vpc-id $vpcId \
                    --query GroupId --output text`

echo 'security group '$securityGroup

aws ec2 authorize-security-group-ingress \
    --group-id $securityGroup \
    --protocol tcp \
    --port 22 \
    --cidr $cidr \
    --region $region

echo 'ouverture du port 22 faite'

aws ec2 authorize-security-group-ingress \
    --group-id $securityGroup \
    --protocol tcp \
    --port 80 \
    --cidr $cidr \
    --region $region

echo 'ouverture du port 80 faite'

KEY_NAME=vm-tp1-key
FILE=keys/$KEY_NAME.pem

if [ ! -f "$FILE" ]; then
    aws ec2 create-key-pair \
        --key-name $KEY_NAME \
        --output text \
        --query KeyMaterial > $FILE
        
    echo 'creation de la cle '$KEY_NAME

    chmod 400 $FILE

    echo 'changement de droits pour la cle '$KEY_NAME
fi

echo 'lancement de l instance de la vm...'

instanceId=`aws ec2 run-instances \
    --image-id ami-00c08ad1a6ca8ca7c \
    --count 1 \
    --instance-type t2.micro \
    --key-name $KEY_NAME \
    --security-group-ids $securityGroup \
    --subnet-id $subnetId \
    --query "Instances[*].InstanceId" --output text`

aws ec2 create-tags --resources $instanceId --tags Key=Name,Value=vm-tp1

echo 'lancement de l instance de la vm termine'

