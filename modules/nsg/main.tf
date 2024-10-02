// Network Security Group
resource "azurerm_network_security_group" "nsg" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.nsg_name
}

// NSG rule to allow all traffic
resource "azurerm_network_security_rule" "allow_all_inbound" {
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
  name                        = "allow_all_inbound"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.allow_all_inbound_from
  destination_address_prefix  = "*"
  // Priority is from range 100-4096 where lower value is higher priority.
  priority                    = 1000
}
