output "public_ip" {
  value = module.vm.public_ip
}

output "username" {
  value = var.username
}

output "password" {
  value = var.password
}

output "ssh_connect" {
  value = module.vm.ssh_connect
}

output "ssh_tunnel" {
  value = module.vm.ssh_tunnel
}
