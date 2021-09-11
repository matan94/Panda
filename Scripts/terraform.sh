#!/bin/bash

# Create if didnt exist and Select terraform workspace
terraform workspace select hello-world || terraform workspace new hello-world

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