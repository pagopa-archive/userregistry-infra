# general
env_short = "p"
location = "westeurope"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Prod"
  Owner       = "usrreg"
  Source      = "https://github.com/pagopa/usrreg-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

lock_enable = true

# 🔐 key vault
key_vault_name = "usrreg-u-kv"

# ☁️ networking
cidr_vnet               = ["10.1.0.0/16"]
cidr_subnet_azdoa       = ["10.1.130.0/24"]
cidr_subnet_appgateway  = ["10.1.128.0/24"]

# dns
external_domain = "pagopa.it"
dns_zone_prefix = "userregistry"

# azure devops
azdo_sp_tls_cert_enabled = true
enable_azdoa             = true
enable_iac_pipeline      = true

# ❇️ app_gateway
api_gateway_sku_name = "WAF_v2"
api_gateway_sku_tier = "WAF_v2"

app_gateway_api_certificate_name = "api-uat-usrreg-pagopa-it"

# postgresql


# apps
