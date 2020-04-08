provider "helm" {
  service_account = "${kubernetes_service_account.tiller_sa.metadata.0.name}"
  namespace       = "${kubernetes_service_account.tiller_sa.metadata.0.namespace}"
  max_history     = var.helm_max_history
  init_helm_home  = true
  version         = "~> 0.10"

  kubernetes {
    host                   = "${aws_eks_cluster.demo.endpoint}"
    cluster_ca_certificate = "${base64decode(aws_eks_cluster.demo.certificate_authority.0.data)}"
    load_config_file       = false
    token                  = "${data.aws_eks_cluster_auth.eks_auth.token}"
  }
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

