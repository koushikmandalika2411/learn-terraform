terraform {
  backend "azurerm" {
    resource_group_name  = "Roboshop-Shell"
    storage_account_name = "azdevopstfstates"
    container_name       = "tfstates"
    key                  = "example.tfstate"
  }
}


output "test" {
  value = "Hello"
}