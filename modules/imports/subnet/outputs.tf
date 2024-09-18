output "subnet_name" {
  value = data.azurerm_subnet.subnet.name
}

output "subnet_id" {
  value = data.azurerm_subnet.subnet.id
}
