output "public_ip" {
  value = module.vm.public_ip
}

output "username" {
  value = var.username
}

output "password" {
  value = var.password
}
