terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75.0"
    }
  }
  required_version = "~> 1.4.6"
}





provider "azurerm" {

  features {

  }
}

variable "testvariable" {
  default     = ["azurerm", "rakesh"]
  description = "testing the variable"
  sensitive   = false
  type        = list(string)

}

resource "azurerm_resource_group" "practice" {
  name     = "mypracticetest"
  location = "eastus"
}



resource "azurerm_resource_group" "itdependson" {
  count      = length(var.testvariable)
  name       = var.testvariable[count.index]
  location   = azurerm_resource_group.practice.location
  depends_on = [azurerm_resource_group.practice]
}