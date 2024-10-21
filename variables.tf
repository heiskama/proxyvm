variable "tenant_id" {
  type        = string
  default     = ""
  description = "Get tenant_id (tenantId) with: `az account show` or `az account list`."
}

variable "subscription_id" {
  type        = string
  default     = ""
  description = "Get subscription_id (id) with: `az account show` or `az account list`."
}

variable "prefix" {
  default     = "proxyvm"
  description = "Prefix to use for resource naming."
}

variable "location" {
  default     = "swedencentral"
  description = "Get supported regions: `az account list-locations -o table`."
}

// Examples:
// Standard_B1s, 1vCPU/1GB, https://cloudprice.net/vm/Standard_B1s
// Standard_DS1_v2, 1vCPU/3.5GB, https://cloudprice.net/vm/Standard_DS1_v2
variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "delete_os_disk_on_deletion" {
  type = string
  default = true
  description = "'true' = Delete OS disk on VM deletion"
}

variable "detach_data_disk_on_deletion" {
  type = string
  default = false
  description = "'true' = detach data disk on VM deletion, 'false' = delete data disk on VM deletion"
}

variable "username" {
  type        = string
  default     = "proxyvm"
  description = "Username requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm-"
}

variable "public_key" {
  type        = string
  default     = "./mykey.pem.pub"
  description = "The Public Key which should be used for authentication, which needs to be in ssh-rsa format with at least 2048-bit or in ssh-ed25519 format."
}

variable "password" {
  type        = string
  default     = ""
  description = "Password requirements: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm-"
}

variable "custom_data" {
  type        = string
  default     = "./cloud-init.sh"
  description = "Run this script at first VM start."
}
