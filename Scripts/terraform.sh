#!/usr/bin/env bash

cd /terraform-code/EKS
terraform init
terraform plan
terraform apply -auto-approve

cd /terraform-code/K8S
terraform init
terraform plan
terraform apply -auto-approve