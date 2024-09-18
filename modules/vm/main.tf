// Public IP
resource "azurerm_public_ip" "pip" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "${var.vm_name}-pip"
  allocation_method   = "Static"
}

// Network interface
resource "azurerm_network_interface" "nic" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "${var.vm_name}-nic"

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

// Virtual machine
resource "azurerm_virtual_machine" "vm" {
  location                         = var.location
  resource_group_name              = var.resource_group_name
  name                             = var.vm_name
  vm_size                          = var.vm_size
  network_interface_ids            = [azurerm_network_interface.nic.id]
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

// Attach NSG to NIC if the NSG ID is provided
resource "azurerm_network_interface_security_group_association" "nicattachment" {
  count                     = var.attach_nsg ? 1 : 0
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.network_security_group_id
}
