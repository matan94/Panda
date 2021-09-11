#!/bin/bash -e

# Select terraform workspace
terraform workspace select hello-world

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