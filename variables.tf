variable "tenant_id" {
  type = string
  default = ""
  description = "Get tenant_id (tenantId) with: `az account show` or `az account list`"
}

variable "subscription_id" {
  default = ""
  description = "Get subscription_id (id) with: `az account show` or `az account list`"
}

variable "prefix" {
  default = "proxyvm"
  description = "Prefix to use for resource naming"
}

variable "location" {
  default = "swedencentral"
  description = "Get supported regions: az account list-locations -o table"
}

// Examples:
// Standard_B1s, 1vCPU/1GB, https://cloudprice.net/vm/Standard_B1s
// Standard_DS1_v2, 1vCPU/3.5GB, https://cloudprice.net/vm/Standard_DS1_v2
variable "vm_size" {
  default = "Standard_B1s"
}

variable "username" {
  default = ""
  description = "Username requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm-"
}

variable "password" {
  default = ""
  description = "Password requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm-"
}
