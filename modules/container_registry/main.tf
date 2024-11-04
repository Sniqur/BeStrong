resource "azurerm_container_registry" "acr" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = "Basic"
  admin_enabled            = false
}
resource "azurerm_role_assignment" "acr_access" {
  principal_id         = var.app_service_identity.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
  # depends_on = [ module.app_service.azurerm_linux_web_app.app ]

}


