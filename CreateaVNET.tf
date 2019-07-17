<# Create a virtual network with Terraform #>
module "network" {
    source              = "Azure/network/azurerm"
    resource_group_name = "az-terraformlabs"
    location            = "westus"
    address_space       = "192.0.0.0/16"
    subnet_prefixes     = ["192.0.1.0/24", "192.0.2.0/24", "192.0.3.0/24"]
    subnet_names        = ["subnet1", "subnet2", "subnet3"]

    tags                = {
                            environment = "Terraform-AzureBR"
                            costcenter  = "LAB001"
                          }
}