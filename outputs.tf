output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "username" {
  value = var.username
}

output "password" {
  value = var.password
}
