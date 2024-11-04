output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}


output "key_vault_private_endpoint_id" {
  value =   azurerm_private_endpoint.kv_private_endpoint.id
}