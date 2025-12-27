resource "azurerm_resource_group" "geeta02" {
  name= "geeta_rg02"
  location= " eastus2"
}
resource "azurerm_virtual_network" "vnet02" {
  name= "geeta_vnet02"
  location= azurerm_resource_group.geeta02.location
  resource_group_name = azurerm_resource_group.geeta02.name
  address_space = ["10.0.0.0/16"]

}

#terraform plan -destroy -target=azurerm_linux_virtual_machine.vm
# like this we can destroy single resorce
