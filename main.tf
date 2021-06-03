# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.61.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTerraform"
  location = "eastus"
}

resource "azurerm_resource_group" "rtech" {
  name        = "rtech-rg"
  location    = "westus"
}

