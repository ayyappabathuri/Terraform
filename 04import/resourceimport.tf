resource "azurerm_resource_group" "rg1" {
  name      = "importrg"
  location  = "East US"
  tags      = {
                 "env" = "prod" 
              }
}

resource "azurerm_virtual_network" "vnet01" {
  name                  = "importvnet"
  resource_group_name   = azurerm_resource_group.rg1.name
  location              = azurerm_resource_group.rg1.location
  address_space         = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet01" {
  name                  = "default"
  resource_group_name   = azurerm_resource_group.rg1.name
  virtual_network_name  = azurerm_virtual_network.vnet01.name
  address_prefixes      = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "subnet02" {
  name = "subnet02"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name = azurerm_resource_group.rg1.name
  address_prefixes = ["10.0.1.0/24"] 
}
# terraform import azurerm_resource_group.rg1 /subscriptions/4fd037e5-e0d0-420c-8c39-cd849005c008/resourceGroups/importrg
# terraform import azurerm_virtual_network.vnet01 /subscriptions/4fd037e5-e0d0-420c-8c39-cd849005c008/resourceGroups/importrg/providers/Microsoft.Network/virtualNetworks/importvnet
# terraform import azurerm_subnet.subnet01 /subscriptions/4fd037e5-e0d0-420c-8c39-cd849005c008/resourceGroups/importrg/providers/Microsoft.Network/virtualNetworks/importvnet/subnets/default