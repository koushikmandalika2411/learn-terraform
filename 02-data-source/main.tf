data "azurerm_resource_group" "example" {
  name = "Roboshop-Shell"
}

output "rg" {
  value = data.azurerm_resource_group.example
}

provider "azurerm" {
  features {}
  subscription_id = "3303fa75-89ef-466f-b4e0-1cfcc504e6d0"
}