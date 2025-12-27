locals {
  vmname= "${var.vmname}-${var.rgname}"
}
locals {
  rg_name_ref= azurerm_resource_group.rg01.name
  rg_location_ref= azurerm_resource_group.rg01.location
  vnet_name_ref= azurerm_virtual_network.vnet01.name
}

resource "azurerm_resource_group" "rg01" {
  name = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnet01" {
  name = var.vnetname
  location= local.rg_location_ref
  resource_group_name = local.rg_name_ref
  address_space = var.ipaddress
}

resource "azurerm_subnet" "sub01" {
  name = "subnet01"
 virtual_network_name = local.vnet_name_ref
 resource_group_name = local.rg_name_ref
 address_prefixes = var.addprefix
}

resource "azurerm_network_interface" "nic01" {
  name = var.nicname
  location = local.rg_location_ref
  resource_group_name = local.rg_name_ref
  ip_configuration {
    name = "ipconfi01"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.sub01.id
    }
}

resource "azurerm_windows_virtual_machine" "vm01" {
  name = local.vmname
  location = local.rg_location_ref
  resource_group_name = local.rg_name_ref
  admin_username = "ramyadmin"
  admin_password = var.pass
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  size = "Standard_D2s_v3"
  network_interface_ids = [
    azurerm_network_interface.nic01.id
  ]
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2025-Datacenter"
    version = "latest"
    }
}