resource "azurerm_resource_group" "AzureDevops" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "AzureDevops" {
  name                     = var.Stroge_account_name
  resource_group_name      = azurerm_resource_group.AzureDevops.name
  location                 = azurerm_resource_group.AzureDevops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "AzureDevops" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.AzureDevops.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "Azuredevops" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.AzureDevops.name
  storage_container_name = azurerm_storage_container.Azuredevops.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
