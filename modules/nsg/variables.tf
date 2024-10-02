
variable "nsg_name" {
  type        = string
  description = "Specifies the name of the Network Security Group."
}

variable "location" {
  type        = string
  description = "Specifies the Azure region/location for the Network Security Group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Network Security Group."
}

variable "allow_all_inbound_from" {
  type        = string
  description = "Allow an IP, CIDR prefix or all traffic with '*'."
}
