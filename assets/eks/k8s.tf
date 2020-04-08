data "aws_eks_cluster_auth" "eks_auth" {
  name = "${var.cluster-name}"
}

provider "kubernetes" {
  host                   = "${aws_eks_cluster.demo.endpoint}"
  cluster_ca_certificate = "${base64decode(aws_eks_cluster.demo.certificate_authority.0.data)}"
  load_config_file       = false
  token                  = "${data.aws_eks_cluster_auth.eks_auth.token}"
  version                = "1.10.0"
}

# https://github.com/helm/helm/blob/master/docs/rbac.md#example-service-account-with-cluster-admin-role
# tiller
resource "kubernetes_service_account" "tiller_sa" {
  metadata {
    name      = "tiller"
    namespace = "kube-system"
  }
  automount_service_account_token = true
  depends_on                      = ["aws_eks_cluster.demo"]
}

resource "kubernetes_cluster_role_binding" "tiller_rb" {
  metadata {
    name = "tiller"
  }

  role_ref {
    # https://github.com/terraform-providers/terraform-provider-kubernetes/issues/204
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    api_group = ""
    kind      = "ServiceAccount"
    name      = "tiller"
    namespace = "kube-system"
  }
  depends_on = ["kubernetes_service_account.tiller_sa"]
}

# create KUBECONFIG file
data "template_file" "kubeconfig" {
  template = file("./creds/kubeconfig-template.yaml")

  vars = {
    cluster_name = var.cluster-name
    endpoint     = aws_eks_cluster.demo.endpoint
    cluster_ca   = aws_eks_cluster.demo.certificate_authority.0.data
  }
}

resource "local_file" "kubeconfig" {
  content  = data.template_file.kubeconfig.rendered
  filename = "./creds/config"
}

