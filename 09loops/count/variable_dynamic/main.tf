resource "azurerm_resource_group" "rg01" {
  name = var.rgname
  location = var.location
}

resource "azurerm_service_plan" "srpn01" {
  count = length(var.webservicename)
  name = var.webservicename[count.index]
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  os_type = "Windows"
  sku_name = "B1"
}

resource "azurerm_windows_web_app" "web01" {
  count = length(var.webname)
  name = var.webname[count.index]
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  service_plan_id = azurerm_service_plan.srpn01[count.index].id
  site_config {}
}


# illa oka variable laga ivali ante manam [count.index ] ani use chestam