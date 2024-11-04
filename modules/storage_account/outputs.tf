# output "storage_account_dependency" {
#   value = azurerm_storage_account.storage
# }
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage.primary_access_key
}

output "fileshare_name" {
  value = azurerm_storage_share.share.name
}