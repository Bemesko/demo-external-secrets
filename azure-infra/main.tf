

# Resource group
resource "azurerm_resource_group" "secrets" {
  name     = "rg-secrets"
  location = "West US 2"
}

# Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "secrets" {
  name                = "aks-secrets"
  location            = azurerm_resource_group.secrets.location
  resource_group_name = azurerm_resource_group.secrets.name
  dns_prefix          = "akssecrets"

  default_node_pool {
    name       = "npsystem"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

}

# Azure Key Vault
resource "azurerm_key_vault" "secrets" {
  name                = "akv-secrets"
  location            = azurerm_resource_group.secrets.location
  resource_group_name = azurerm_resource_group.secrets.name
  sku_name            = "standard"

  tenant_id = var.azure_tenant_id
}

data "azurerm_kubernetes_cluster" "secrets" {
  name                = azurerm_kubernetes_cluster.secrets.name
  resource_group_name = azurerm_kubernetes_cluster.secrets.resource_group_name
}
