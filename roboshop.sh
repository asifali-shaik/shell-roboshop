#!/bin/bash

SG_ID="sg-0e4cc6ef0fc01d10d"
AMI_ID="ami-0220d79f3f480ecf5"

for instance in $@
do 
    aws ec2 run-instance --image-id $AMI_ID --instance-type t3.micro --tag-specifications
    "ResourceType=instance,Tags=[{key=Name,Value=$instance}]" --query 'Reservations[0].Instance[0].
    PrivateIpAddress' --output text 
done