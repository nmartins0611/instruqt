#!/bin/bash

export AWS_DEFAULT_REGION=us-east-1


# Create default vpc
aws ec2 create-default-vpc >> /tmp/aws_vpc