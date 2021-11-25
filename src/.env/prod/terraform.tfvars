# general
env_short = "p"
location  = "westeurope"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Prod"
  Owner       = "usrreg"
  Source      = "https://github.com/pagopa/usrreg-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

lock_enable = true

# key vault
key_vault_name = "usrreg-u-kv"

# networking
cidr_vnet            = ["10.1.0.0/16"]
cidr_subnet_postgres = ["10.1.129.0/24"]
cidr_subnet_azdoa    = ["10.1.130.0/24"]

# dns
external_domain = "pagopa.it"
dns_zone_prefix = "userregistry"

# azure devops
enable_azdoa        = true
enable_iac_pipeline = true

# apim


# app_gateway


# postgres
postgres_private_endpoint_enabled      = true
postgres_sku_name                      = "GP_Gen5_2"
postgres_public_network_access_enabled = false
postgres_geo_redundant_backup_enabled  = true

# apps
