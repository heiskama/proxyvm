variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network."
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet."
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefixes of the Subnet."
}
