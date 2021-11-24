# 🔭 Monitor
data "azurerm_resource_group" "rg_monitor" {
  name  = format("%s-monitor-rg", local.project)
}

data "azurerm_application_insights" "application_insights" {
  name                = format("%s-appinsights", local.project)
  resource_group_name = data.azurerm_resource_group.rg_monitor.name
}

# 🔭 monitor action groups

data "azurerm_monitor_action_group" "slack" {
  resource_group_name = local.monitor_rg
  name                = local.monitor_action_group_slack_name
}

data "azurerm_monitor_action_group" "email" {
  resource_group_name = local.monitor_rg
  name                = local.monitor_action_group_email_name
}
