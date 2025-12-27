resource "azurerm_resource_group" "myrg01" {
  name= "rg01"
  location= "eastus"
  tags = { 
    "env" = "prod"
      }
}
