# AWS SHELL SCRIPT | PROJECT

## Write a script to report the usage of AWS in your project?
Organization ==> example.com
only using resources are ==? EC2, S3, LAMBDA, IAM 
**GOAL?**
Everyday at 6pm you have to give this report to a manager

using shell script we create a file for usage resources. like how many instances are running etc.
This shell script is integrated with cronjob and schedule the script at 6pm.
So one you schedule at 6pm one of your linux process wait for 6pm to execute the script
Using cronjob I can execute the script at any given time

**Pre-req:**
- Install AWS CLI 
- aws configure

## Project start

vim aws_resources_tracker.sh

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
set -x // Debug-mode
# Resources we are Tracking
# AWS S3
# AWS IAM
# AWS EC2
# AWS LAMBDA
############################
# s3 bucket list
echo "Print list of s3 bucket"
aws s3 ls

# list EC2 Instance
echo "Print list of EC2 Instances with specific Instance ID"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list aws lambda
echo "Print list of lambda ducntions"
aws lambda list-functions

# list IAM users
echo "Print list of IAM users"
aws iam list-users | jq '.Users[].UserName'

Now integrate script file with crontab
crontab -e //If it’s your first time, it will ask which editor to use — choose nano for simplicity.
crontab -l // verify cronjob

## What is the Difference between Crontab and Cronjob?
1. Cron — the background scheduler
- Cron is a daemon (background service) that runs all the time on your Linux system.
- It constantly checks if there are any tasks that need to be executed at that minute.

Crontab means “cron table”.
It’s where you define the list of commands or scripts that cron should execute — and when.

Cron Job — an individual scheduled task
A cron job is a single entry (task) inside a crontab file.

Example crontab:

# ┌───────────── minute
# │ ┌───────────── hour
# │ │ ┌───────────── day of month
# │ │ │ ┌───────────── month
# │ │ │ │ ┌───────────── day of week
# │ │ │ │ │
# * * * * *  command_to_run

0 18 * * * /home/youruser/automate.sh
15 10 * * 1 /home/youruser/report.sh

Here:
/home/youruser/automate.sh → one cron job (runs every day at 6 PM)
/home/youruser/report.sh → another cron job (runs Mondays at 10:15 AM)

Together, they live inside your crontab.

Both are executed by the cron daemon.
