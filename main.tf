terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

 subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}
resource "azurerm_resource_group" "rg" {
  name     = "terraform-rep-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "storageacc" {
  name                     = "rajterraform801"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  account_kind             = "StorageV2"

  access_tier              = "Hot"

  tags = {
    Environment = "Dev"
    Owner       = "Rajasekhar"
    Project     = "Terraform"
  }
}
