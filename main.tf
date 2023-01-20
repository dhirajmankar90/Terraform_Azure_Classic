# Remote
terraform {
  backend "azurerm" {
  }
}

locals {
  rg_name = format("rg-%s", var.resource_group_name ) 
  #rg-dev-01
}

## creating resource group
resource "azurerm_resource_group" "rg" {
  name = local.rg_name
  location = var.location
  tags = var.tags
}

# VARIABLES 
variable "resource_group_name" {
  type = string
  description = "name of resource group"
  #default = "dev-01"
}

variable "location" {
  type = string
  default = "westus"
}

variable "tags" {
  type = map
  description = "(optional) describe your variable"
}
