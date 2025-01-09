data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "Roboshop-shellVN"
  resource_group_name  = data.azurerm_resource_group.example.name
}

resource "azurerm_network_interface" "example" {
  name                = "test-nic"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }

}