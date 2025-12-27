terraform {
  required_providers {
    azurerm= {
        source="hashicorp/azurerm"
        version = "=4.57.0"
    }
  }
}
terraform {
  backend "azurerm" {
    access_key           = ""  # Can also be set via `ARM_ACCESS_KEY` environment variable.
    storage_account_name = ""                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = ""                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
   subscription_id = "4fd037e5-e0d0-420c-8c39-cd849005c008"
}