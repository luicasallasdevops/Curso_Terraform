
resource "azurerm_resource_group" "rg" {
  provider = azurerm.utec
  for_each = local.environments
  name     = "${local.name_RG}-${each.key}"
  location = each.value
  tags = local.tags
}

resource "azurerm_storage_account" "storage" {
  provider = azurerm.utec
  for_each = local.environments
  name                     = "${local.name_storage}${each.key}"
  resource_group_name      = "${local.name_RG}-${each.key}"
  location                 = each.value
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = local.tags
  depends_on = [ azurerm_resource_group.rg ]
}
/*
resource "azurerm_application_insights" "appinsights" {
  provider = azurerm.utec
  name                = "appin-curso-terraform"
  resource_group_name = "${local.name_RG}-${each.key}"
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
  tags = local.tags
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  provider = azurerm.utec
  name                = "akv-curso-terraform"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags = local.tags
}

resource "azurerm_machine_learning_workspace" "ml" {
  provider = azurerm.utec
  name                = "mlw-simple-demo"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name = "Basic"

  storage_account_id      = azurerm_storage_account.storage.id
  key_vault_id            = azurerm_key_vault.kv.id
  application_insights_id = azurerm_application_insights.appinsights.id

  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}
*/