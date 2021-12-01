# from Microsoft docs https://docs.microsoft.com/it-it/azure/aks/ingress-internal-ip
module "nginx_ingress" {

  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = kubernetes_namespace.usrreg.metadata[0].name
  repository = "https://kubernetes.github.io/ingress-nginx"
  app = {
    name          = "ingress-nginx"
    version       = "3.33.0"
    chart         = "ingress-nginx"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }

  values = [
    "${templatefile("${path.module}/ingress/loadbalancer.yaml.tpl", { load_balancer_ip = var.ingress_load_balancer_ip })}"
  ]

  set = [
    {
      name  = "controller.replicaCount"
      value = var.ingress_replica_count
    },
    {
      name  = "controller.nodeSelector.beta\\.kubernetes\\.io/os"
      value = "linux"
    },
    {
      name  = "defaultBackend.nodeSelector.beta\\.kubernetes\\.io/os"
      value = "linux"
    },
    {
      name  = "controller.admissionWebhooks.patch.nodeSelector.beta\\.kubernetes\\.io/os"
      value = "linux"
    }
  ]

  depends_on = [
    kubernetes_namespace.ingress
  ]
}
