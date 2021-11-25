# general
env_short = "d"
location  = "germanywestcentral"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Dev"
  Owner       = "usrreg"
  Source      = "https://github.com/pagopa/usrreg-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

lock_enable = false

# key vault
key_vault_name    = "usrreg-d-kv"
key_vault_rg_name = "usrreg-d-sec-rg"

# networking
cidr_vnet            = ["10.1.0.0/16"]
cidr_subnet_postgres = ["10.1.129.0/24"]
cidr_subnet_azdoa    = ["10.1.130.0/24"]

# dns
external_domain = "pagopa.it"
dns_zone_prefix = "dev.userregistry"

# azure devops
azdo_sp_tls_cert_enabled = true
enable_azdoa             = true
enable_iac_pipeline      = true

# apim


# app_gateway


# postgres
postgres_private_endpoint_enabled      = false
postgres_sku_name                      = "B_Gen5_1"
postgres_public_network_access_enabled = false
postgres_network_rules = {
  ip_rules = [
    "0.0.0.0/0"
  ]
  # dblink
  allow_access_to_azure_services = false
}

# apps
