resource "azurerm_service_plan" "asp" {
  name                = "bestrong-app-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "B1"
  os_type             = "Linux"
  # depends_on = [ module.storage_account.azurerm_storage_account.storage]

}

resource "azurerm_linux_web_app" "app" {
  name                = "bestrong-app-service12"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.asp.id
  

  site_config {
    always_on = false
    vnet_route_all_enabled = true

  }

    storage_account {
    name         = var.stor_acc_name 
    account_name = var.stor_acc_name
    access_key   = var.primary_access_key
    share_name   = var.fileshare_name
    mount_path   = "/mnt/fileshare"
    type         = "AzureFiles"


  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.instrumentation_key
  }
}



# Інтеграція App Service з підмережею VNet через Swift Connection
resource "azurerm_app_service_virtual_network_swift_connection" "app_vnet_integration" {
  app_service_id      = azurerm_linux_web_app.app.id
  subnet_id           = var.azurerm_subnet_default
}