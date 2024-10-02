// Network Security Group
data "azurerm_network_security_group" "nsg" {
  resource_group_name = var.resource_group_name
  name                = var.nsg_name
}
