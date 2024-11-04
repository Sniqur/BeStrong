variable "resource_group_name" {
  description = "The name of the resource group"
}
variable "location" {
  description = "The location of the resource group"
}
variable "vnet_subnet_id" {
    description = "The ID of the subnet dedicated to SQL"
}
variable "sql_admin_user" {
  type        = string
  sensitive   = true

}
variable "sql_admin_password" {
  type        = string
  sensitive   = true
}
