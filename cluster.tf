data "ns_connection" "cluster" {
  name     = "cluster"
  contract = "cluster/aws/k8s:eks"
}

locals {
  cluster_id             = data.ns_connection.cluster.outputs.cluster_id
  cluster_name           = data.ns_connection.cluster.outputs.cluster_name
  cluster_endpoint       = data.ns_connection.cluster.outputs.cluster_endpoint
  cluster_ca_certificate = data.ns_connection.cluster.outputs.cluster_ca_certificate
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_name
}

provider "kubernetes" {
  host                   = local.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = local.cluster_endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
  }
}
