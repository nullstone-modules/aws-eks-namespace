data "ns_connection" "cluster" {
  name     = "cluster"
  contract = "cluster/aws/k8s:eks"
}

locals {
  cluster_arn                 = data.ns_connection.cluster.outputs.cluster_arn
  cluster_name                = data.ns_connection.cluster.outputs.cluster_name
  cluster_endpoint            = data.ns_connection.cluster.outputs.cluster_endpoint
  cluster_ca_certificate      = data.ns_connection.cluster.outputs.cluster_ca_certificate
  cluster_oidc_issuer         = try(data.ns_connection.cluster.outputs.cluster_oidc_issuer, "")
  cluster_openid_provider_arn = try(data.ns_connection.cluster.outputs.cluster_openid_provider_arn, "")
}

ephemeral "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_name
}

provider "kubernetes" {
  host                   = local.cluster_endpoint
  token                  = ephemeral.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
}
