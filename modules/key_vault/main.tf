resource "azurerm_key_vault" "kv" {
  name                        = "bestrong-kv12"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  
  # Інтеграція з VNet для обмеження доступу
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [
    var.vnet_subnet_id
  ]
  }
}

resource "azurerm_private_endpoint" "kv_private_endpoint" {
  name = "kv-private-endpoint"
  location = var.location
  resource_group_name = var.resource_group_name
  subnet_id = var.vnet_subnet_id

    private_service_connection {
      name = "keyVaultPrivateConnction"
      private_connection_resource_id = azurerm_key_vault.kv.id
      subresource_names = ["vault"]
      is_manual_connection = false
    }
}

resource "azurerm_key_vault_access_policy" "app_service_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.app_service_identity.identity[0].principal_id

  secret_permissions = ["Get", "List"]
}

data "azurerm_client_config" "current" {}
