data "azurerm_resource_group" "example" {
  name = "Roboshop-Shell"
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "Roboshop-shellVN"
  resource_group_name  = data.azurerm_resource_group.example.name
}

#
# provider "azurerm" {
#   features {}
#   subscription_id = "3303fa75-89ef-466f-b4e0-1cfcc504e6d0"
# }