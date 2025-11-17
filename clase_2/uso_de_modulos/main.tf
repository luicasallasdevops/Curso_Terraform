module "aprovisionamiento" {
  providers =  {
    azurerm = azurerm.utec
  }
  source = "./modules/machine_learning"
  name_rg = "utec"
  name_stac = "luis"
}

module "laboratorio" {
  providers = {
    azurerm = azurerm.utec
  }
  source = "./modules/machine_learning"
  name_rg = "col"
  name_stac = "lab"
}

output "id_storages_aprovisionamiento" {
  value = module.aprovisionamiento.id_storage_account
}