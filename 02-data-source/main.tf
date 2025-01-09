data "azurerm_resource_group" "example" {
  name = "project-setup-1"
}

output "rg" {
  value = data.azurerm_resource_group
}