terraform {
    required_version = ">= 0.15.0"
    required_providers {
        kubernetes = {
        source  = "hashicorp/kubernetes"
        version = "2.2.0"
    }
  }
}

provider "kubernetes" {
    config_path = "/etc/k3s.yaml"
}

resource "kubernetes_namespace" "hacker_company" {
  metadata {
    name = "hacker-company"
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "frontend"
    namespace = kubernetes_namespace.hacker_company.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"

          # Define a liveness probe if necessary
          liveness_probe {
            exec {
              command = ["your", "liveness", "probe", "command"]
            }
          }
        }
      }
    }
  }
}


output "debug" {
    value = "Good luck! :) "
}