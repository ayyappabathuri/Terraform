resource "azurerm_resource_group" "rg01" {
 name = "cbdstrg01"
 location = "southindia"
}
resource "azurerm_storage_account" "strg01" {
  name = "cbdstrg01"
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  lifecycle {
    ignore_changes = [ tags ]
    prevent_destroy = true # we cannont delete this resource and we cannon replace to anothr resource
  }
}