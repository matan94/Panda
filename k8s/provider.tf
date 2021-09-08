provider "kubernetes" {
  host = data.kubernetes.cluster.endpoint
  config_path = "~/.kube/config"
}