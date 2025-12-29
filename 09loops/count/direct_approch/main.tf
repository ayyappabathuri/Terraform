locals {
  rg_ref_name= azurerm_resource_group.rg01.name
  loc_ref_name= azurerm_resource_group.rg01.location
}
resource "azurerm_resource_group" "rg01" {
  name = var.rgname
  location = var.location 
  }

resource "azurerm_service_plan" "svpn" {
  count = 3
  name = "linuxservice-0${count.index+1}"
  location = local.loc_ref_name
  resource_group_name = local.rg_ref_name
  os_type = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "web" {
  count = 3
  name = "linuxweb-0${count.index+1}"
  location = local.loc_ref_name
  resource_group_name = local.rg_ref_name
  service_plan_id = azurerm_service_plan.svpn[count.index].id
  site_config {
    always_on = true
    ftps_state = "FtpsOnly"
    http2_enabled = true

    }
}