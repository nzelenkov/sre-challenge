# Variables Configuration

variable "cluster-name" {
  type    = "string"
  default = "eks-docc"
}

variable "cluster-dns" {
  type    = string
  default = "cluster.local"
}

variable "min_size" {
  type    = string
  default = "2"
}

variable "max_size" {
  type    = string
  default = "16"
}

variable "role-name" {
  type    = string
  default = "eks-doccc"
}

# https://aws.amazon.com/ec2/instance-types/
variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "helm_max_history" {
  type    = string
  default = "200"
}

variable "aws-account" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

# https://www.terraform.io/docs/providers/aws/r/eks_cluster.html#enabling-iam-roles-for-service-accounts
variable "cluster-version" {
  type    = string
  default = "1.14"
}

