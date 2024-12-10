output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "username" {
  value = var.username
}

output "password" {
  value = var.password
}

output "ssh_connect" {
  value = "ssh -i ${trimsuffix(var.public_key, ".pub")} ${var.username}@${azurerm_public_ip.pip.ip_address}"
}

output "ssh_tunnel" {
  value = "ssh -i ${trimsuffix(var.public_key, ".pub")} -D 8080 ${var.username}@${azurerm_public_ip.pip.ip_address}"
}
