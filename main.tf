terraform {
  required_version = "~> 1.9.5"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
  cloud { 
    
    organization = "Labsforclass" 

    workspaces { 
      name = "TerraformCI" 
    } 
  } 
}

variable "ARM_CLIENT_SECRET" {
  description = "WzQ8Q~z.yvwUf7.oGPmYagcZPnKgeglGk6Lmqb5V"
  type        = string
}

provider"azurerm" {
  features {}
  skip_provider_registration = true
}

resource "random_string" "uniquestring" {
  length = 20
  special = false
  upper = false
}

resource "azurerm_resource_group" "rg" {
  name = "811-0a96a200-provide-continuous-delivery-with-gith"
  location = "eastus"
}

resource "azurerm_storage_account" "storageaccount" {
  name                      = "stg${random_string.uniquestring.result}"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}