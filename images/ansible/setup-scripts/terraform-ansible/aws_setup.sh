#!/bin/bash

export AWS_DEFAULT_REGION=us-east-1


# Create default vpc
aws ec2 create-default-vpc >> /tmp/aws_vpc

# Create keypair from controller
aws ec2 import-key-pair --key-name "controller_ssh" --public-key-material fileb://~/.ssh/id_rsa.pub