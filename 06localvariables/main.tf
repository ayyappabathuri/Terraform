#use case1
locals {
  rg_name= "${var.project}-${var.env}-rg"
  vnet_name="${var.project}-${var.env}-vnet"
}
#usecase2
locals {
  all_tags={
    env = var.env
    project= var.project
    managed= "terraform"
  }
}
#usecase3
locals {
  rg_ref_name=azurerm_resource_group.rgname.name
}
resource "azurerm_resource_group" "rgname" {
  name= local.rg_name
  location = "southindia"
  tags = local.all_tags
}
resource "azurerm_virtual_network" "vnetname" {
  name = local.vnet_name
  resource_group_name = local.rg_ref_name
  address_space = ["192.168.0.0/16"]
  location = "southindia"
}