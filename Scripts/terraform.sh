#!/bin/bash

# Create if didnt exist and Select terraform workspace
terraform workspace select hello-world || terraform workspace new hello-world

# Create VPC and EKS cluster
cd /terraform-project
terraform init
terraform plan
terraform apply -auto-approve
terraform output config-map
terraform output kubeconfig > kubeconfig
aws eks update-kubeconfig --name matanbpanda-eks-cluster1

# Create Hello-World Deployment
cd /terraform-project/k8s
terraform init
terraform plan
terraform apply -auto-approve