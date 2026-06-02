terraform {
    required_providers {
       azurerm ={
        source = "hashicorp/azurerm"
        version = "~> 4.0"
       }
    }
}
provider "azurerm" {
    features {}
    subscription_id = "53d2e2e6-dfa9-4edd-b5e8-305c0b80b6fb"
    tenant_id = "a439bc92-4bd0-4748-a835-a8d9aa68b7a1"
    }

variable "Groups" {
    type = list(string)
    default =  ["SREETEST", "SREETEST1"]
  
}

resource "azurerm_resource_group" "RG"{
    for_each = toset(var.Groups)
    name = each.value
  location = "centralindia"
}