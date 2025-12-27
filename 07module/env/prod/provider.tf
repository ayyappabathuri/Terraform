terraform {
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version = "=4.57.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "statefilestorage01"
    container_name = "statefile"
    key = "prod/terraform.statefile"
    resource_group_name = "rgst01"
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features { }
  subscription_id = "4fd037e5-e0d0-420c-8c39-cd849005c008"
}
