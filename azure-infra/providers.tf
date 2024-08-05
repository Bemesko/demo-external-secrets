provider "azurerm" {
  features {}
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
}

provider "azuread" {
  tenant_id = var.azure_tenant_id
}

provider "kubernetes" {
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].cluster_ca_certificate)
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_key)
  config_path            = "~/.kube/config"
  config_context         = data.azurerm_kubernetes_cluster.secrets.name
  host                   = data.azurerm_kubernetes_cluster.secrets.kube_config[0].host
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].cluster_ca_certificate)
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_key)
    config_path            = "~/.kube/config"
    config_context         = data.azurerm_kubernetes_cluster.secrets.name
    host                   = data.azurerm_kubernetes_cluster.secrets.kube_config[0].host
  }
}

provider "kubectl" {
  config_path            = "~/.kube/config"
  config_context         = data.azurerm_kubernetes_cluster.secrets.name
  host                   = data.azurerm_kubernetes_cluster.secrets.kube_config[0].host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].cluster_ca_certificate)
}
