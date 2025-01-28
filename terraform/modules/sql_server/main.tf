resource "azurerm_mssql_server" "sql_server" {
  name                         = "bestrong-sql-server"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_user
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "DB" {
  depends_on = [ azurerm_mssql_server.sql_server ]
  name = "BeStrong-DB"
  server_id = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 2
  sku_name = "S0"
  min_capacity = 2
    
    lifecycle {
        prevent_destroy = false
      }

}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "example-sql-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.vnet_subnet_id

  private_service_connection {
    name                           = "sql-private-connection"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection = false
  }
}

resource "azurerm_mssql_virtual_network_rule" "example" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mssql_server.sql_server.id
  subnet_id = var.vnet_subnet_id
}