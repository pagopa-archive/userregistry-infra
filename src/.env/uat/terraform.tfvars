# general
env_short = "u"
env       = "uat"
location = "northeurope"
tags = {
  CreatedBy   = "Terraform"
  Environment = "UAT"
  Owner       = "UserRegistry"
  Source      = "https://github.com/pagopa/userregistry-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}
lock_enable = false

# 🔐 key vault
key_vault_name    = "usrreg-u-kv"
key_vault_rg_name = "usrreg-u-sec-rg"

# ☁️ networking
cidr_vnet               = ["10.1.0.0/16"]
cidr_subnet_azdoa       = ["10.1.130.0/24"]
cidr_subnet_postgres    = ["10.1.129.0/24"]
cidr_subnet_appgateway  = ["10.1.128.0/24"]
cidr_subnet_apim        = ["10.1.136.0/24"]

# dns
external_domain = "pagopa.it"
dns_zone_prefix = "uat.userregistry"

# azure devops
azdo_sp_tls_cert_enabled = true
enable_azdoa             = true
enable_iac_pipeline      = true

# ❇️ app_gateway
app_gateway_sku_name = "Standard_v2"
app_gateway_sku_tier = "Standard_v2"
app_gateway_api_certificate_name = "api-uat-userregistry-pagopa-it"

app_gateway_alerts_enabled=false
app_gateway_waf_enabled=false

# 🗄 postgresql
postgres_sku_name       = "GP_Gen5_2"
postgres_enable_replica = false
postgres_public_network_access_enabled = true
postgres_alerts_enabled = false

#
# 🗺 APIM
#
apim_publisher_name = "PagoPA SelfCare UAT"
apim_sku            = "Developer_1"
apim_api_internal_certificate_name = "api-internal-uat-userregistry-pagopa-it"

#
# ⛴ AKS
#
aks_private_cluster_enabled = false
aks_alerts_enabled          = false
# This is the k8s ingress controller ip. It must be in the aks subnet range.
reverse_proxy_ip            = "10.1.0.250"
aks_max_pods                = 100
aks_enable_auto_scaling     = true
aks_node_min_count          = 1
aks_node_max_count          = 1
aks_vm_size                 = "Standard_D4s_v3"
