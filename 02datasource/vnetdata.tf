data "azurerm_virtual_network" "test01" {
  name = "vnet01"
  resource_group_name = "dev01"
}
resource "azurerm_subnet" "sub01" {
  name = "subnet01"
  virtual_network_name = data.azurerm_virtual_network.test01.name
  resource_group_name = data.azurerm_virtual_network.test01.resource_group_name
  address_prefixes = ["10.0.1.0/24"] 
}