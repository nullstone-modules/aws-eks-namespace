output "region" {
  value       = local.region
  description = "string ||| The region where the EKS cluster resides."
}

output "cluster_arn" {
  value       = local.cluster_arn
  description = "string ||| AWS Arn for EKS Fargate cluster."
}

output "cluster_name" {
  value       = local.cluster_name
  description = "string ||| Name of the EKS Fargate cluster."
}

output "cluster_endpoint" {
  value       = local.cluster_endpoint
  description = "string ||| Endpoint address for EKS Fargate cluster."
}

output "cluster_ca_certificate" {
  value       = local.cluster_ca_certificate
  description = "string ||| Base64-encoded certificate to connect to cluster."
}

output "cluster_oidc_issuer" {
  value       = local.cluster_oidc_issuer
  description = "string ||| Cluster certificate issuer used by OpenID Connect Provider"
}

output "cluster_openid_provider_arn" {
  value       = local.cluster_openid_provider_arn
  description = "string ||| (Optional) ARN of the OpenID Connect Provider that is used to provide IAM roles with Kubernetes Service Accounts"
}

output "kubernetes_namespace" {
  value       = local.k8s_namespace
  description = "The namespace in kubernetes"
}
