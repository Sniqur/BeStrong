terraform {


  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "bestrong-rg-backend"
    storage_account_name = "bestrongsabackend"
    container_name       = "bestrong-cont-back"
    key                  = "terraform.tfstate"
    # use_oidc = true



  }

}
