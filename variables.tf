variable "sql_admin_user" {
  type    = string

}
variable "sql_admin_password" {
    type    = string

}
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "Sweden Central"
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "bestrong-rg"

}
variable "tenant_id" {
  type    = string
  default = "f128dd7a-1fd1-4e3e-8496-674b767ef552"
}
