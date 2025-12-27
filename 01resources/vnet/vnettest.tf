resource "azurerm_resource_group" "g01" {
  name= "g_rg01"
  location= " eastus2"
}
resource "azurerm_virtual_network" "v01" {
  name= "g_vnet01"
  location= azurerm_resource_group.g01.location
  resource_group_name = azurerm_resource_group.g01.name
  address_space = ["10.0.0.0/16"]

}
resource "azurerm_resource_group" "geeta03" {
  name= "geeta_rg03"
  location= " eastus2"
}
resource "azurerm_virtual_network" "vnet03" {
  name= "geeta_vnet03"
  location= azurerm_resource_group.geeta03.location
  resource_group_name = azurerm_resource_group.geeta03.name
  address_space = ["10.0.0.0/16"]

}