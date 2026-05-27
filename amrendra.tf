terraform{
  required_providers{
    azurerm = {
      source = "hashicorp/azurerm"
      vresion = "4.68.0"
    }
  }
  
} 
provider "azurerm"{
  features{}
}

resource "azurerm_resource_group" "example"{
  name = "examplerg"
  location = "west us"
}
resource "azurerm_storage_account" "examplest"{
  name = "example-storage"
  resource_group_name = azure_resource_group.example.name
  location = "west us"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

backend "azurerm" {
        resource_group_name = "rg-shri"                                   # Can also be set via `ARM_USE_AZUREAD` environment variable.
        tenant_id            = "b7279b60-c72f-4c9c-8d40-c31771c8621b"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
        storage_account_name = "stashri"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
        container_name       = "shricon"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
        key                  = "prod.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
wfx-peaf-vxu