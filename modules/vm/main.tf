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
resource "azurerm_linux_virtual_machine" "vm" {
  location                         = var.location
  resource_group_name              = var.resource_group_name
  name                             = var.vm_name
  size                             = var.vm_size
  network_interface_ids            = [azurerm_network_interface.nic.id]
  custom_data                      = var.custom_data == null ? null : file(var.custom_data)

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  # OS settings
  computer_name  = var.vm_name
  admin_username = var.username

  # Authenticate with a key
  admin_ssh_key {
    username   = var.username
    public_key = file(var.public_key)
  }

  # Authenticate with a password
  #disable_password_authentication = false
  #admin_password                  = var.password
}

// Attach NSG to NIC if the NSG ID is provided
resource "azurerm_network_interface_security_group_association" "nicattachment" {
  #count                     = var.attach_nsg ? 1 : 0
  count                     = var.network_security_group_id == null ? 0 : 1
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.network_security_group_id
}
