terraform {
  required_version = ">=1.0.6"
  required_providers {
    azurerm = {
      version = "= 2.86.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.10.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.6.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
  }

  backend "azurerm" {}
}

provider "kubernetes" {
  host        = "https://${var.k8s_apiserver_host}:${var.k8s_apiserver_port}"
  insecure    = var.k8s_apiserver_insecure
  config_path = var.k8s_kube_config_path
}

provider "helm" {
  kubernetes {
    host        = "https://${var.k8s_apiserver_host}:${var.k8s_apiserver_port}"
    insecure    = var.k8s_apiserver_insecure
    config_path = var.k8s_kube_config_path
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}
