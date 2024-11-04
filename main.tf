# Підключення модулів
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  
}

module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  # vnet_subnet_id      = module.network.app_service_subnet_id
  azurerm_subnet_default = module.network.subnet_default
  instrumentation_key = module.application_insights.instrumentation_key
  primary_access_key = module.storage_account.storage_account_primary_access_key 
  stor_acc_name = module.storage_account.storage_account_name
  fileshare_name = module.storage_account.fileshare_name
  depends_on = [module.network]

}

module "container_refistry" {
  source = "./modules/container_registry"
  name = "bestrongacr21"
  resource_group_name = module.resource_group.resource_group_name
  location = var.location
  app_service_identity = module.app_service.app_identity_id
}

module "storage_account" {
  source              = "./modules/storage_account"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_subnet_id      = module.network.private_endpoint_storacc_subnet_id
    depends_on = [module.network]

}

module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_subnet_id     = module.network.private_endpoint_kv_subnet_id
  app_service_identity = module.app_service.app_identity_id
  depends_on = [module.network]
}

module "sql" {
  source              = "./modules/sql_server"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_subnet_id      = module.network.private_endpoint_sql_subnet_id
  sql_admin_password = var.sql_admin_password
  sql_admin_user = var.sql_admin_user
  depends_on = [module.network]


}

module "application_insights" {
  source              = "./modules/app_insights"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  app_service_id      = module.app_service.app_id
}
