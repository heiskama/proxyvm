variable "location" {
  type        = string
  description = "Location of the Virtual Network."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network."
}

variable "address_space" {
  type        = list(string)
  description = "Address space(s) of the Virtual Network."
}
