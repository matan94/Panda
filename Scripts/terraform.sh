#!/bin/bash -e

terraform workspace select hello-world
cd /terraform-eks
terraform init
terraform plan
terraform apply -auto-approve

cd /terraform-eks/k8s
terraform init
terraform plan
terraform apply -auto-approve