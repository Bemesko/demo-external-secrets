provider "azurerm" {
  features {}
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.secrets.kube_config[0].host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.secrets.kube_config[0].host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].cluster_ca_certificate)
  }
}

provider "kubectl" {
  host                   = data.azurerm_kubernetes_cluster.secrets.kube_config[0].host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.secrets.kube_config[0].cluster_ca_certificate)
}
