data "azurerm_resource_group" "example" {
  name = "Roboshop-Shell"
}

output "file" {
  value = data.azurerm_resource_group
}