resource "azurerm_virtual_network" "vnet" {
  name                = "bestrongvnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "bestrong_default_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]


  delegation {
    name = "appservice-delegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet" "private_endpoint_storacc_subnet_id" {
  name                 = "private-endpoint-subnet-storacc"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints = ["Microsoft.Storage"]


}

resource "azurerm_subnet" "private_endpoint_kv_subnet_id" {
  name                 = "private-endpoint-subnet-keyvault"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
  service_endpoints = ["Microsoft.KeyVault"]
}

resource "azurerm_subnet" "private_endpoint_sql_subnet_id" {
  name                 = "private-endpoint-subnet-sql"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.4.0/24"]
    service_endpoints    = ["Microsoft.Sql"]

}