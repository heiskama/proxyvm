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

variable "password" {
  type        = string
  description = "Password requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm-"
}

variable "attach_nsg" {
  type        = bool
  default     = false
  description = "Attach NSG to the NIC? If 'true', provide also 'network_security_group_id'."
}

variable "network_security_group_id" {
  type        = string
  default     = ""
  description = "Network Security Group ID to use for NIC attachment when 'attach_nsg = true'."
}
