variable "location" {
  type    = string
  default = "westeurope"
}

variable "prefix" {
  type    = string
  default = "selc"
}

variable "env" {
  type = string
}

variable "env_short" {
  type = string
}

#
# 🔐 Key Vault
#
variable "key_vault_name" {
  type        = string
  description = "Key Vault name"
  default     = ""
}

variable "key_vault_rg_name" {
  type        = string
  default     = ""
  description = "Key Vault - rg name"
}

#
# ⛴ K8s
#

variable "k8s_kube_config_path_prefix" {
  type    = string
  default = "~/.kube"
}

# variable "k8s_apiserver_host" {
#   type = string
# }

variable "k8s_apiserver_port" {
  type    = number
  default = 443
}

variable "k8s_apiserver_insecure" {
  type    = bool
  default = false
}

variable "rbac_namespaces_for_deployer_binding" {
  type        = list(string)
  description = "Namespaces where to apply deployer binding rules"
}

# ingress

variable "ingress_replica_count" {
  type = string
}

variable "ingress_load_balancer_ip" {
  type = string
}

variable "default_service_port" {
  type    = number
  default = 8080
}

variable "nginx_helm_version" {
  type        = string
  description = "NGINX helm verison"
}


# # gateway
# variable "api_gateway_url" {
#   type = string
# }
# variable "cdn_frontend_url" {
#   type = string
# }
# variable "spid_testenv_url" {
#   type    = string
#   default = null
# }

# variable "enable_postgres_replica" {
#   type        = bool
#   default     = false
#   description = "Enable connection to postgres replica"
# }

# # uservice versions
# variable "api-version_uservice-attribute-registry-management" {
#   type = string
# }

# variable "api-version_uservice-party-management" {
#   type = string
# }

# variable "api-version_uservice-party-process" {
#   type = string
# }

# variable "api-version_uservice-party-registry-proxy" {
#   type = string
# }

# # configs/secrets

# variable "configmaps_hub-spid-login-ms" {
#   type = map(string)
# }

# variable "configmaps_ms-product" {
#   type = map(string)
# }

# variable "configmaps_b4f-dashboard" {
#   type = map(string)
# }

# variable "configmaps_uservice-attribute-registry-management" {
#   type = map(string)
# }

# variable "configmaps_uservice-party-management" {
#   type = map(string)
# }

# variable "configmaps_uservice-party-process" {
#   type = map(string)
# }

# variable "configmaps_uservice-party-registry-proxy" {
#   type = map(string)
# }

#
# 🀄️ LOCALS
#
locals {
  project = format("%s-%s", var.prefix, var.env_short)
  #   redis_url                       = "${format("%s-redis", local.project)}.redis.cache.windows.net"
  #   postgres_hostname               = "${format("%s-postgresql", local.project)}.postgres.database.azure.com"
  #   postgres_replica_hostname       = var.enable_postgres_replica ? "${format("%s-postgresql-rep", local.project)}.postgres.database.azure.com" : local.postgres_hostname
  #   mongodb_name_selc_product       = "selcProduct"
  #   contracts_storage_account_name  = replace(format("%s-contracts-storage", local.project), "-", "")
  #   contracts_storage_container     = format("%s-contracts-blob", local.project)
  #   appinsights_instrumentation_key = format("InstrumentationKey=%s", module.key_vault_secrets_query.values["appinsights-instrumentation-key"].value)
}
