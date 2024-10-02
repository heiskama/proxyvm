// Terraform configuration
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

// Provider configuration
provider "azurerm" {
  features {}
  tenant_id                       = "${var.tenant_id}"
  subscription_id                 = "${var.subscription_id}"
  #skip_provider_registration      = "true"  # Deprecated
  resource_provider_registrations = "none"
}

// Resource Group
module "rg" {
  source              = "./modules/rg"
  location            = var.location
  resource_group_name = "${var.prefix}-rg"
}

// Import existing Resource Group
//module "rg" {
//  source              = "./modules/imports/rg"
//  resource_group_name = "${var.prefix}-rg"
//}

// Virtual Network
module "vnet" {
  source               = "./modules/vnet"
  location             = var.location
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = "${var.prefix}-vnet"
  address_space        = ["10.0.0.0/16"]
}

// Import existing Virtual Network
//module "vnet" {
//  source               = "./modules/imports/vnet"
//  resource_group_name  = module.rg.resource_group_name
//  virtual_network_name = "${var.prefix}-vnet"
//}

// Subnet
module "subnet1" {
  source               = "./modules/subnet"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = module.vnet.virtual_network_name
  subnet_name          = "subnet1"
  address_prefixes     = ["10.0.1.0/24"]
}

// Import existing Subnet
//module "subnet1" {
//  source               = "./modules/imports/subnet"
//  resource_group_name  = module.rg.resource_group_name
//  virtual_network_name = module.vnet.virtual_network_name
//  subnet_name          = "subnet1"
//}

// Network Security Group
module "nsg" {
  source                  = "./modules/nsg"
  location                = var.location
  resource_group_name     = module.rg.resource_group_name
  nsg_name                = "${var.prefix}-nsg"
  allow_all_inbound_from  = "*"
}

// Import existing Network Security Group
//module "nsg" {
//  source                  = "./modules/imports/nsg"
//  resource_group_name     = module.rg.resource_group_name
//  nsg_name                = "${var.prefix}-nsg"
//}

// Virtual Machine
module "vm" {
  source                    = "./modules/vm"
  location                  = var.location
  resource_group_name       = module.rg.resource_group_name
  vm_name                   = "${var.prefix}"
  vm_size                   = var.vm_size
  subnet_id                 = module.subnet1.subnet_id
  username                  = var.username
  password                  = var.password
  attach_nsg                = true
  network_security_group_id = module.nsg.nsg_id
}
