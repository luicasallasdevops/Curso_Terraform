/*
output "id_machine_learning" {
  value = azurerm_machine_learning_workspace.ml.id
}

output "workspace_id_machine_learning" {
  value = azurerm_machine_learning_workspace.ml.workspace_id
}
*/

output "id_storage_account" {
  value = {
    for clave, recurso in azurerm_storage_account.storage :
    clave => recurso.id
  }
}

output "name_storage_account" {
  value = {
    for clave, recurso in azurerm_storage_account.storage :
    clave => recurso.name
  }
}