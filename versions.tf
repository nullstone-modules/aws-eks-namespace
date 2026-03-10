terraform {
  required_version = ">= 1.11.0"

  required_providers {
    ns = {
      source  = "nullstone-io/ns"
      version = "~> 0.8"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }
  }
}
