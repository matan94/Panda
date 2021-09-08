provider "kubernetes" {
  host = data.aws_eks_cluster.cluster.endpoint
  config_path = "~/.kube/config"
}