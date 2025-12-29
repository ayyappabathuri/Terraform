resource "azurerm_resource_group" "rg01" {
  for_each      = var.function_app
  name          = each.value.rgname
  location      = each.value.location
}

resource "azurerm_storage_account" "st01" {
  for_each                  = var.function_app
  name                      = each.value.stname
  resource_group_name       = azurerm_resource_group.rg01[each.key].name
  location                  = azurerm_resource_group.rg01[each.key].location
  account_replication_type  = "LRS"
  account_tier              = "Standard"
}

resource "azurerm_service_plan" "plan01" {
  for_each                  = var.function_app 
  name                      = each.value.splan
  resource_group_name       = azurerm_resource_group.rg01[each.key].name
  location                  = azurerm_resource_group.rg01[each.key].location
  os_type                   = each.value.ostype
  sku_name                  = each.value.skuname
}

resource "azurerm_windows_function_app" "winfun" {
  for_each = var.function_app
  name = each.value.winname
  resource_group_name = azurerm_resource_group.rg01[each.key].name
  location = azurerm_resource_group.rg01[each.key].location
  service_plan_id = azurerm_service_plan.plan01[each.key].id
  storage_account_name = azurerm_storage_account.st01[each.key].name
  storage_account_access_key = azurerm_storage_account.st01[each.key].primary_access_key
  site_config {}
}