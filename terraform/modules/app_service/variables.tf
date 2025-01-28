variable "resource_group_name" {
    description = "The name of the resource group"
}
variable "location" {
    description = "The location of the resource group"
}
variable "azurerm_subnet_default" {
    description = "The ID of the subnet \"default\" "
}
variable "instrumentation_key" {
    description = "Instrumentation key of app insights"
}
variable "primary_access_key" {
    description = "Storage account primary access key"
}
variable "stor_acc_name" {
    description = "Storage account name"
}
variable "fileshare_name" {
    description = "The name of fileshare (taken from Storage account module)"
}
