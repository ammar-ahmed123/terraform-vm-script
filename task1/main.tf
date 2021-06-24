provider "azurerm" {
  features {}
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "salman"
  }
}

#create a terraform tf file
terraform {
  backend "azurerm" {
    resource_group_name   = "kopicloud-tstate-rg"
    storage_account_name  = "kopicloudtfstate8132"
    container_name        = "tfstate1"
    key                   = "tfstatefiles"
  }
}
#access_key: gkMFKVItRS4wpaYtiwA8XZ2wiq/kmsb5fX/01QXDb/qu+2Ppg50QM3PJ/KLDfey5UIb79nOs09XBvNavm70gbA==
