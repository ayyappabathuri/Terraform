terraform {
  required_providers {
    azurerm = {
        source="hashicorp/azurerm"
        version = "=4.57.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "statefilestorage01"
    resource_group_name = "rgst01"
    container_name = "statefile"
    key = "cbd/statefile.ftstate"
  }
}

provider "azurerm" {
  resource_provider_registrations= "none"
  subscription_id= "4fd037e5-e0d0-420c-8c39-cd849005c008"
  features{}
}