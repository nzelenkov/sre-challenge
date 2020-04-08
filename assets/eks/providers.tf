#
# Provider Configuration
#

provider "aws" {
  version    = "~> 2.5"
  region     = "eu-west-1"
  access_key = "AKIA3FNZMP6V66UQGZJC"
  secret_key = "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"
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {
  version = "~> 1.1"
}

provider "local" {
  version = "~> 1.3"
}

provider "template" {
  version = "~> 2.1"
}

provider "null" {
  version = "~> 2.1"
}

