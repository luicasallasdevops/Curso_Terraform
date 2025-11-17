locals {
  central = "Central US"
  name_RG = "rg${var.name_rg}curso"
  name_storage = "stac${var.name_stac}curso"

  tags = {
    organizacion = "utec"
    tipo = "curso"
  }

  environments = {
    dev = "East US"
    cer = "West US 2"
    prod = local.central
  }

}