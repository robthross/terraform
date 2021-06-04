variable "web_server_location1" {}
variable "web_server_location2" {}
variable "web_server_rtech1" {}
variable "web_server_rtech2" {}


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
  name     = "${var.web_server_rtech1}"
  location = "${var.web_server_location1}"
}

resource "azurerm_resource_group" "rtech" {
  name        = "${var.web_server_rtech2}"
  location    = "${var.web_server_location2}"
}

