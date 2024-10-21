variable "location" {
  type        = string
  description = "Location of the virtual machine."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine."
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Size of the virtual machine."
}

variable "subnet_id" {
  default     = ""
  description = "Subnet ID of the virtual machine."
}

variable "username" {
  type        = string
  description = "Username requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm-"
}

variable "public_key" {
  type        = string
  description = "Path to the public key."
}

variable "password" {
  type        = string
  default     = null
  description = "Password requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm-"
}

variable "custom_data" {
  type        = string
  default     = null
  description = "This can be used as a cloud-init script."
}

#variable "attach_nsg" {
#  type        = bool
#  default     = false
#  description = "Attach NSG to the NIC? If 'true', provide also 'network_security_group_id'."
#}

variable "network_security_group_id" {
  type        = string
  default     = null
  #description = "Network Security Group ID to use for NIC attachment when 'attach_nsg = true'."
  description = "Network Security Group ID to use for NIC attachment."
}
