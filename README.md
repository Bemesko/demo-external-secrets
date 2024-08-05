# Demo: AKS + Key Vault using External Secrets

## Overview

This project automates the deployment of an Azure Key Vault, an Azure Kubernetes Service (AKS) cluster, and the External Secrets operator, all using Terraform. This setup includes applying Kubernetes manifests for Custom Resource Definitions (CRDs) and installing a Helm chart for the External Secrets operator.

## To Do

- [ ] Use Workload Identity instead of service principal to authenticate with key vault
