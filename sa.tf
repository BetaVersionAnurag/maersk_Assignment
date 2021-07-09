resource "azurerm_storage_account" "maersk" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.maersk.name
  location                 = azurerm_resource_group.maersk.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
