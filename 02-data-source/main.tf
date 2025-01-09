terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }
}
data "azurerm_resource_group" "example" {
  name = "Roboshop-Shell"
}

output "rg" {
  value = data.azurerm_resource_group.example
}

provider "azurerm" {
  features {}
}