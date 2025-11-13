terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
  client_id       = ""
  tenant_id       = ""
  client_secret   = ""
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-curso-terraform"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = var.name_resource
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_application_insights" "appinsights" {
  name                = "appin-curso-terraform"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = "akv-curso-terraform"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_machine_learning_workspace" "ml" {
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
}
