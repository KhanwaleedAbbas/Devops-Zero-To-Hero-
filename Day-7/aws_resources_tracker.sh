#!/bin/bash
PATH=/usr/bin:/bin:/usr/local/bin
#
###################
# Author: Waleed
# Date: 14 OCT 2025
#
# Version: v1
#
# This script will report the AWS resource usage
# ##########################
#
set -x
# Resources we are Tracking
# AWS S3
# AWS IAM
# AWS EC2
# AWS LAMBDA 
#
# s3 bucket list
echo "Print list of s3 bucket"
aws s3 ls >> /home/ubuntu/cron.log

# list EC2 Instance
echo "Print list of EC2 Instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'  >> /home/ubuntu/cron.log

# list aws lambda 
echo "Print list of lambda ducntions"
aws lambda list-functions  >> /home/ubuntu/cron.log

# list IAM users
echo "Print list ofIAM users"
aws iam list-users | jq '.Users[].UserName'  >> /home/ubuntu/cron.log
