variable "web_server_location1" {}
variable "web_server_location2" {}
variable "web_server_rtech1" {}
variable "web_server_rtech2" {}
variable "web_server_prefix" {}
variable "web_server_address_space1" {}
variable "web_server_address_space2" {}
variable "web_server_address_subnet1" {}
variable "web_server_address_subnet2" {}

# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.62.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rtech1" {
  name     = var.web_server_rtech1
  location = var.web_server_location1
}

resource "azurerm_resource_group" "rtech2" {
  name        = var.web_server_rtech2
  location    = var.web_server_location2
}

resource "azurerm_virtual_network" "web_server_vnet1" {
  name                  = var.web_server_prefix
  location              = var.web_server_location1
  resource_group_name   = azurerm_resource_group.rtech1.name
  address_space         = [var.web_server_address_space1]
}

resource "azurerm_virtual_network" "web_server_vnet2" {
  name                  = var.web_server_prefix
  location              = var.web_server_location2
  resource_group_name   = azurerm_resource_group.rtech2.name
  address_space         = [var.web_server_address_space2]
}

resource "azurerm_subnet" "web_server_subnet1" {
  name                  = var.web_server_prefix
  resource_group_name   = azurerm_resource_group.rtech1.name
  virtual_network_name  = azurerm_virtual_network.web_server_vnet1.name
  address_prefixes      = [var.web_server_address_subnet1]
}

resource "azurerm_subnet" "web_server_subnet2" {
  name                  = var.web_server_prefix
  resource_group_name   = azurerm_resource_group.rtech2.name
  virtual_network_name  = azurerm_virtual_network.web_server_vnet2.name
  address_prefixes      = [var.web_server_address_subnet2]
}
