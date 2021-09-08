provider "kubernetes" {
  host = module.eks.cluster_id
  config_path = "~/.kube/config"
}

provider "aws" {
  version = "~> 3.56.0"
  region  = "us-east-1"
}