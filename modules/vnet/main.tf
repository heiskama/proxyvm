resource "azurerm_virtual_network" "vnet" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.virtual_network_name
  address_space       = var.address_space
}
