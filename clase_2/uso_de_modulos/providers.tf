terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = ""
  client_id       = ""
  tenant_id       = ""
  client_secret   = ""
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  alias = "utec"
  subscription_id = ""
  client_id       = ""
  tenant_id       = ""
  client_secret   = ""
}