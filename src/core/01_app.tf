resource "azurerm_resource_group" "rg_app" {
  name     = format("%s-app-rg", local.project)
  location = var.location
  tags     = var.tags
}

#
# 📦 ACR
#
module "acr" {
  source              = "git::https://github.com/pagopa/azurerm.git//container_registry?ref=v1.0.84"
  name                = replace(format("%s-acr", local.project), "-", "")
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
  admin_enabled       = false

  tags = var.tags
}
