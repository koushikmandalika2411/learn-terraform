data "azurerm_resource_group" "example" {
  name = "Roboshop-Shell"
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "Roboshop-shellVN"
  resource_group_name  = data.azurerm_resource_group.example.name
}