---
title: "Embedded tab content"
disableToc: true
hidden: true
---

```
# Install jq
sudo yum -y install jq

# Update global CDK version
npm install -g aws-cdk --force

# Setting environment variables required to communicate with AWS API's via the cli tools
echo "export AWS_DEFAULT_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)" >> ~/.bashrc
echo "export AWS_REGION=\$AWS_DEFAULT_REGION" >> ~/.bashrc
echo "export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)" >> ~/.bashrc
source ~/.bashrc

# Print out AWS env variables
env | grep "AWS"
```
