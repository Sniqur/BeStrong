resource "azurerm_storage_account" "storage" {
  name                     = "bestrongstoracc"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "share" {
  name                 = "app-fileshare"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}

resource "azurerm_private_endpoint" "storage_private_endpoint" {
  name                = "storage-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.vnet_subnet_id

  private_service_connection {
    name                           = "storage-private-connection"
    private_connection_resource_id = azurerm_storage_account.storage.id
    subresource_names              = ["file"]
    is_manual_connection = false
  }
}

resource "azurerm_storage_account_network_rules" "storage_network_rules" {
  storage_account_id = azurerm_storage_account.storage.id
  default_action     = "Deny"
  virtual_network_subnet_ids = [
    var.vnet_subnet_id
  ]
}