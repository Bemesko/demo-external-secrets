# Define a variable for the External Secrets operator version
variable "external_secrets_version" {
  description = "The version of the External Secrets operator"
  type        = string
  default     = "0.10.0"
}

# # Fetch the CRD manifest from the internet using the version variable
# data "http" "external_secrets_crds" {
#   url = "https://raw.githubusercontent.com/external-secrets/external-secrets/v${var.external_secrets_version}/deploy/crds/bundle.yaml"
# }

# # Apply each resource in the CRD manifest
# resource "kubectl_manifest" "external_secrets_crd" {
#   for_each  = data.http.external_secrets_crds
#   yaml_body = each.value
# }

# nstall the Helm chart for external-secrets
resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  namespace        = "external-secrets"
  create_namespace = true

  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  version    = var.external_secrets_version

  set {
    name  = "installCRDs"
    value = "true" # couldnt bother to try to handle the crd files
  }
}

resource "kubectl_manifest" "secret-store" {
  yaml_body = file("yaml/secret-store.yaml")
}

resource "kubectl_manifest" "external-secret" {
  yaml_body = file("yaml/external-secret.yaml")
}

