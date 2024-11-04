
output "subnet_default" {
  value = azurerm_subnet.default.id
}

output "private_endpoint_storacc_subnet_id" {
  value = azurerm_subnet.private_endpoint_storacc_subnet_id.id
}

output "private_endpoint_kv_subnet_id" {
  value = azurerm_subnet.private_endpoint_kv_subnet_id.id
}

output "private_endpoint_sql_subnet_id" {
  value = azurerm_subnet.private_endpoint_sql_subnet_id.id
}

