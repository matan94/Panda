#resource "kubernetes_namespace" "hello-world" {
#  metadata {
#    name = var.hw_name
#  }
#}
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

resource "kubernetes_deployment" "hello-world" {
  metadata {
    name = var.hw_name
    #namespace = kubernetes_namespace.hello-world.metadata.0.name
    labels = {
      App = var.hw_name
    }
  }


  spec {
    replicas = 2
    selector {
      match_labels = {
        App = var.hw_name
      }
    }
    template {
        metadata {
            labels = {
            App = var.hw_name
            }
        }
        spec {
            container {
            image = var.hw_image
            name  = var.hw_name
                port {
            container_port = 80
                }
            }
        }
    }
  }
}