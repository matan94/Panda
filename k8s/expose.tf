# Create a load balancer 

resource "kubernetes_service" "hello-world" {
  metadata {
    name = var.hw_name
  }
  spec {
    selector = {
     App = "${kubernetes_deployment.hello-world.spec.0.template.0.metadata[0].labels.App}"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
}
}