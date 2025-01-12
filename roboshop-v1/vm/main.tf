resource "azurerm_public_ip" "main" {
  name                = "${var.component}-ip"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  allocation_method   = "Static"

  tags = {
    component = var.component
  }
}

resource "azurerm_network_interface" "main" {
  name                = "${var.component}-nic"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.component
  location              = data.azurerm_resource_group.example.location
  resource_group_name   = data.azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/3303fa75-89ef-466f-b4e0-1cfcc504e6d0/resourceGroups/ssss_group/providers/Microsoft.Compute/galleries/coustomPractice/images/coustomImage/versions/1.0.0"
  }
  storage_os_disk {
    name              = var.component
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.component
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    component = var.component
  }
  # connection {
  #   type     = "ssh"
  #   user     = "testadmin"
  #   password = "Password1234!"
  #   host     = azurerm_public_ip.main.ip_address
  # }
  #
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo dnf install python3.12-pip -y",
  #     "sudo pip3.12 install ansible",
  #     "ansible-pull -i localhost, -U https://github.com/koushikmandalika2411/Roboshop-ansible roboshop.yml -e app_name${var.component} -e ENV=dev"
  #   ]
  # }
}