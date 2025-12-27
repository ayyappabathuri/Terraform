resource "azurerm_resource_group" "rg01" {
 name = "cbdstrg01"
 location = "southindia"
}
resource "azurerm_storage_account" "strg01" {
  name = "cbdstrg02"
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  lifecycle {
    create_before_destroy = true
  }
}