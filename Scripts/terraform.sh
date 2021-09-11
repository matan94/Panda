#!/bin/bash -e

# Select terraform workspace
terraform workspace select $env_name || terraform workspace new $env_name

# Create VPC
cd /terraform-project
terraform init
terraform plan
terraform apply -auto-approve

# Create EKS cluster
cd /terraform-project/k8s
terraform init
terraform plan
terraform apply -auto-approve