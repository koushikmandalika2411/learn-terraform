data "azurerm_resource_group" "example" {
  name = "Roboshop-Shell"
}

output "rg" {
  value = data.azurerm_resource_group
}