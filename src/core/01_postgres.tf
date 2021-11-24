# 🔐 KV data

data "azurerm_key_vault_secret" "postgres_administrator_login" {
  name         = "postgres-administrator-login"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "postgres_administrator_login_password" {
  name         = "postgres-administrator-login-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

#--------------------------------------------------------------------------------------------------

resource "azurerm_resource_group" "postgres_rg" {
  name     = format("%s-postgres-rg", local.project)
  location = var.location

  tags = var.tags
}

## Database subnet
module "postgres_snet" {
  source                                         = "git::https://github.com/pagopa/azurerm.git//subnet?ref=v1.0.84"
  name                                           = format("%s-postgres-snet", local.project)
  address_prefixes                               = var.cidr_subnet_postgres
  resource_group_name                            = data.azurerm_resource_group.rg_vnet.name
  virtual_network_name                           = data.azurerm_virtual_network.vnet.name
  service_endpoints                              = ["Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}

// azure-database-postgres-configuration ignored because these rules are not correctly evaluated! this configuration is enabled using postgres_configurations var
#tfsec:ignore:azure-database-postgres-configuration-log-checkpoints
#tfsec:ignore:azure-database-postgres-configuration-log-connection-throttling
#tfsec:ignore:azure-database-postgres-configuration-log-connections
module "postgresql" {
  source = "git::https://github.com/pagopa/azurerm.git//postgresql_server?ref=v1.0.84"

  name                             = format("%s-postgresql", local.project)
  location                         = azurerm_resource_group.postgres_rg.location
  resource_group_name              = azurerm_resource_group.postgres_rg.name
  virtual_network_id               = data.azurerm_virtual_network.vnet.id
  subnet_id                        = module.postgres_snet.id
  administrator_login              = data.azurerm_key_vault_secret.postgres_administrator_login.value
  administrator_login_password     = data.azurerm_key_vault_secret.postgres_administrator_login_password.value
  sku_name                         = var.postgres_sku_name
  storage_mb                       = var.postgres_storage_mb
  db_version                       = 11
  geo_redundant_backup_enabled     = var.postgres_geo_redundant_backup_enabled
  enable_replica                   = var.postgres_enable_replica
  ssl_minimal_tls_version_enforced = "TLS1_2"
  public_network_access_enabled    = var.postgres_public_network_access_enabled
  lock_enable                      = var.lock_enable

  network_rules         = var.postgres_network_rules
  replica_network_rules = var.postgres_replica_network_rules

  configuration         = var.postgres_configuration
  configuration_replica = var.postgres_configuration

  alerts_enabled                        = var.postgres_alerts_enabled
  monitor_metric_alert_criteria         = var.postgres_metric_alerts
  replica_monitor_metric_alert_criteria = var.postgres_metric_alerts
  action = [
    {
      action_group_id    = data.azurerm_monitor_action_group.email.id
      webhook_properties = null
    },
    {
      action_group_id    = data.azurerm_monitor_action_group.slack.id
      webhook_properties = null
    }
  ]
  replica_action = [
    {
      action_group_id    = data.azurerm_monitor_action_group.email.id
      webhook_properties = null
    },
    {
      action_group_id    = data.azurerm_monitor_action_group.slack.id
      webhook_properties = null
    }
  ]

  tags = var.tags
}
