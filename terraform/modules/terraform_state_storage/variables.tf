variable "name" {
  description = "Name of the Storage Account for Terraform state"
}

variable "resource_group_name" {
  description = "Resource group where the Storage Account will be created"
}

variable "location" {
  description = "Azure region where the Storage Account will be created"
}

variable "container_name" {
  description = "Name of the container in Storage Account for Terraform state"
}
