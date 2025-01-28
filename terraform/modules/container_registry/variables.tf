variable "name" {
    description = "Name of ACR"
}
variable "location" {
    description = "The location of the resource group"
}
variable "resource_group_name" {
    description = "The name of the resource group"
}
variable "app_service_identity" {
    description = "App dervice identity (to fetch identity`s Principal ID) "
}
