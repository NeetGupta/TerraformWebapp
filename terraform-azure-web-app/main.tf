provider "azurerm" {
  features {}
}

# Calling the resource group module
module "resource_group" {
  source = "./modules/resource_group"
  rg_name = "my-rg"
  location = "East US"
}
