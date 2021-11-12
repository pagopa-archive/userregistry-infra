# general
env_short = "u"
location = "germanywestcentral"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Uat"
  Owner       = "usrreg"
  Source      = "https://github.com/pagopa/usrreg-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

lock_enable = false

# 🔐 key vault
key_vault_name = "usrreg-p-kv"

# ☁️ networking
cidr_vnet               = ["10.1.0.0/16"]
cidr_subnet_azdoa       = ["10.1.130.0/24"]
cidr_subnet_appgateway  = ["10.1.128.0/24"]

# dns
external_domain = "pagopa.it"
dns_zone_prefix = "uat.userregistry"

# azure devops
azdo_sp_tls_cert_enabled = true
enable_azdoa             = true
enable_iac_pipeline      = true

# ❇️ app_gateway
api_gateway_sku_name = "Standard_v2"
api_gateway_sku_tier = "Standard_v2"

app_gateway_api_certificate_name = "api-prod-usrreg-pagopa-it"

# postgresql


# apps
