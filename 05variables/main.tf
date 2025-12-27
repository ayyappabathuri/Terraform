resource "azurerm_resource_group" "rg1" {
  name     = var.rg_name
  location = "westus2"

  tags = {
    env = "prod"
  }
}

resource "azurerm_virtual_network" "vnet01" {
  name                = var.vnet01_name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  address_space       = var.vnet_ip
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet01_name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.0.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet01
  ]
}

resource "azurerm_network_interface" "nic01" {
  name                = var.nic_name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location

  ip_configuration {
    name                          = var.ipconfig_name
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [
    azurerm_subnet.subnet01
  ]
}

resource "azurerm_windows_virtual_machine" "vm01" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  size                = "Standard_D2s_v3"

  admin_username = "adminuser"
  admin_password = "P@$$w0rd1234!"

  network_interface_ids = [
    azurerm_network_interface.nic01.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  depends_on = [
    azurerm_network_interface.nic01
  ]
}
