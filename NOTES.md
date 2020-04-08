aws configure
AWS Access Key ID [****************T7B6]: 
AWS Secret Access Key [****************vjcZ]: 
Default region name [eu-west-1]: 
Default output format [text]:

terraform login

Terraform will store the token in plain text in the following file
for use by subsequent commands:
    /home/z/.terraform.d/credentials.tfrc.json

Token for app.terraform.io: 

Retrieved token for user docc


---------------------------------------------------------------------------------

Success! Terraform has obtained and saved an API token.

terraform init

Initializing the backend...

Successfully configured the backend "remote"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "template" (hashicorp/template) 2.1.2...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...
- Downloading plugin for provider "helm" (hashicorp/helm) 0.10.4...
- Downloading plugin for provider "kubernetes" (hashicorp/kubernetes) 1.11.0...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.50.0...
- Downloading plugin for provider "http" (hashicorp/http) 1.1.1...
- Downloading plugin for provider "local" (hashicorp/local) 1.4.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

terraform plan
Running plan in the remote backend. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/domain-docc/docc/runs/run-MpUaPTAYtwq65e3r

Waiting for the plan to start...

Terraform v0.12.21
Configuring remote state backend...
Initializing Terraform configuration...
2020/02/28 10:57:01 [DEBUG] Using modified User-Agent: Terraform/0.12.21 TFC/9836ec2a1f
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.http.workstation-external-ip: Refreshing state...
data.aws_availability_zones.available: Refreshing state...
data.aws_eks_cluster_auth.eks_auth: Refreshing state...
data.aws_region.current: Refreshing state...
data.helm_repository.stable: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_ami.eks-worker will be read during apply
  # (config refers to values not yet known)
 <= data "aws_ami" "eks-worker"  {
      + architecture          = (known after apply)
      + block_device_mappings = (known after apply)
      + creation_date         = (known after apply)
      + description           = (known after apply)
      + hypervisor            = (known after apply)
      + id                    = (known after apply)
      + image_id              = (known after apply)
      + image_location        = (known after apply)
      + image_owner_alias     = (known after apply)
      + image_type            = (known after apply)
      + kernel_id             = (known after apply)
      + most_recent           = true
      + name                  = (known after apply)
      + owner_id              = (known after apply)
      + owners                = [
          + "602401143452",
        ]
      + platform              = (known after apply)
      + product_codes         = (known after apply)
      + public                = (known after apply)
      + ramdisk_id            = (known after apply)
      + root_device_name      = (known after apply)
      + root_device_type      = (known after apply)
      + root_snapshot_id      = (known after apply)
      + sriov_net_support     = (known after apply)
      + state                 = (known after apply)
      + state_reason          = (known after apply)
      + tags                  = (known after apply)
      + virtualization_type   = (known after apply)

      + filter {
          + name   = "name"
          + values = [
              + "amazon-eks-node-1.14-v*",
            ]
        }
    }

  # data.template_file.kubeconfig will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "kubeconfig"  {
      + id       = (known after apply)
      + rendered = (known after apply)
      + template = <<~EOT
            apiVersion: v1
            kind: Config
            clusters:
            - cluster:
                server: ${endpoint}
                certificate-authority-data: ${cluster_ca}
              name: kubernetes
            contexts:
            - context:
                cluster: kubernetes
                user: aws
              name: aws
            current-context: aws
            preferences: {}
            users:
            - name: aws
              user:
                exec:
                  apiVersion: client.authentication.k8s.io/v1alpha1
                  command: aws-iam-authenticator
                  args:
                    - "token"
                    - "-i"
                    - "${cluster_name}"
        EOT
      + vars     = {
          + "cluster_ca"   = (known after apply)
          + "cluster_name" = "eks-docc"
          + "endpoint"     = (known after apply)
        }
    }

  # aws_autoscaling_group.demo will be created
  + resource "aws_autoscaling_group" "demo" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 2
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = (known after apply)
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + load_balancers            = (known after apply)
      + max_size                  = 16
      + metrics_granularity       = "1Minute"
      + min_size                  = 2
      + name                      = (known after apply)
      + name_prefix               = "eks-docc"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + target_group_arns         = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"

      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "com.domain.plex.eks.eks-docc"
        }
      + tag {
          + key                 = "kubernetes.io/cluster/eks-docc"
          + propagate_at_launch = true
          + value               = "owned"
        }
    }

  # aws_eks_cluster.demo will be created
  + resource "aws_eks_cluster" "demo" {
      + arn                       = (known after apply)
      + certificate_authority     = (known after apply)
      + created_at                = (known after apply)
      + enabled_cluster_log_types = [
          + "api",
          + "audit",
        ]
      + endpoint                  = (known after apply)
      + id                        = (known after apply)
      + identity                  = (known after apply)
      + name                      = "eks-docc"
      + platform_version          = (known after apply)
      + role_arn                  = (known after apply)
      + status                    = (known after apply)
      + tags                      = {
          + "Name" = "com.domain.plex.eks.eks-docc"
        }
      + version                   = "1.14"

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = false
          + endpoint_public_access    = true
          + public_access_cidrs       = (known after apply)
          + security_group_ids        = (known after apply)
          + subnet_ids                = (known after apply)
          + vpc_id                    = (known after apply)
        }
    }

  # aws_iam_instance_profile.demo-node will be created
  + resource "aws_iam_instance_profile" "demo-node" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "eks-docc"
      + path        = "/"
      + role        = "eks-docc-node"
      + roles       = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.demo-cluster will be created
  + resource "aws_iam_role" "demo-cluster" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-docc"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role.demo-node will be created
  + resource "aws_iam_role" "demo-node" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-docc-node"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSClusterPolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = "eks-docc"
    }

  # aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSServicePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
      + role       = "eks-docc"
    }

  # aws_iam_role_policy_attachment.demo-node-AmazonEC2ContainerRegistryReadOnly will be created
  + resource "aws_iam_role_policy_attachment" "demo-node-AmazonEC2ContainerRegistryReadOnly" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      + role       = "eks-docc-node"
    }

  # aws_iam_role_policy_attachment.demo-node-AmazonEKSWorkerNodePolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKSWorkerNodePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      + role       = "eks-docc-node"
    }

  # aws_iam_role_policy_attachment.demo-node-AmazonEKS_CNI_Policy will be created
  + resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKS_CNI_Policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      + role       = "eks-docc-node"
    }

  # aws_internet_gateway.demo will be created
  + resource "aws_internet_gateway" "demo" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "eks-docc"
        }
      + vpc_id   = (known after apply)
    }

  # aws_launch_configuration.demo will be created
  + resource "aws_launch_configuration" "demo" {
      + arn                         = (known after apply)
      + associate_public_ip_address = true
      + ebs_optimized               = (known after apply)
      + enable_monitoring           = true
      + iam_instance_profile        = (known after apply)
      + id                          = (known after apply)
      + image_id                    = (known after apply)
      + instance_type               = "t2.small"
      + key_name                    = (known after apply)
      + name                        = (known after apply)
      + name_prefix                 = "eks-docc"
      + security_groups             = (known after apply)
      + user_data_base64            = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_route_table.demo will be created
  + resource "aws_route_table" "demo" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.demo[0] will be created
  + resource "aws_route_table_association" "demo" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.demo[1] will be created
  + resource "aws_route_table_association" "demo" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.demo-cluster will be created
  + resource "aws_security_group" "demo-cluster" {
      + arn                    = (known after apply)
      + description            = "Cluster communication with worker nodes"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "eks-docc"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "com.domain.plex.eks.eks-docc"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.demo-node will be created
  + resource "aws_security_group" "demo-node" {
      + arn                    = (known after apply)
      + description            = "Security group for all nodes in the cluster"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "eks-docc"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"                           = "com.domain.plex.eks.eks-docc"
          + "kubernetes.io/cluster/eks-docc" = "owned"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group_rule.demo-cluster-ingress-node-https will be created
  + resource "aws_security_group_rule" "demo-cluster-ingress-node-https" {
      + description              = "Allow pods to communicate with the cluster API Server"
      + from_port                = 443
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 443
      + type                     = "ingress"
    }

  # aws_security_group_rule.demo-cluster-ingress-workstation-https will be created
  + resource "aws_security_group_rule" "demo-cluster-ingress-workstation-https" {
      + cidr_blocks              = [
          + "18.234.160.215/32",
        ]
      + description              = "Allow workstation to communicate with the cluster API Server"
      + from_port                = 443
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 443
      + type                     = "ingress"
    }

  # aws_security_group_rule.demo-node-ingress-cluster will be created
  + resource "aws_security_group_rule" "demo-node-ingress-cluster" {
      + description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
      + from_port                = 1025
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 65535
      + type                     = "ingress"
    }

  # aws_security_group_rule.demo-node-ingress-self will be created
  + resource "aws_security_group_rule" "demo-node-ingress-self" {
      + description              = "Allow node to communicate with each other"
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 65535
      + type                     = "ingress"
    }

  # aws_subnet.demo[0] will be created
  + resource "aws_subnet" "demo" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "eu-west-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"                           = "com.domain.plex.eks.eks-docc"
          + "kubernetes.io/cluster/eks-docc" = "shared"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.demo[1] will be created
  + resource "aws_subnet" "demo" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "eu-west-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"                           = "com.domain.plex.eks.eks-docc"
          + "kubernetes.io/cluster/eks-docc" = "shared"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.demo will be created
  + resource "aws_vpc" "demo" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/24"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name"                           = "com.domain.plex.eks.eks-docc"
          + "kubernetes.io/cluster/eks-docc" = "shared"
        }
    }

  # kubernetes_cluster_role_binding.tiller_rb will be created
  + resource "kubernetes_cluster_role_binding" "tiller_rb" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "tiller"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }

      + role_ref {
          + api_group = "rbac.authorization.k8s.io"
          + kind      = "ClusterRole"
          + name      = "cluster-admin"
        }

      + subject {
          + api_group = (known after apply)
          + kind      = "ServiceAccount"
          + name      = "tiller"
          + namespace = "kube-system"
        }
    }

  # kubernetes_service_account.tiller_sa will be created
  + resource "kubernetes_service_account" "tiller_sa" {
      + automount_service_account_token = true
      + default_secret_name             = (known after apply)
      + id                              = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "tiller"
          + namespace        = "kube-system"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }
    }

  # local_file.kubeconfig will be created
  + resource "local_file" "kubeconfig" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./creds/config"
      + id                   = (known after apply)
    }

Plan: 27 to add, 0 to change, 0 to destroy.

Warning: Interpolation-only expressions are deprecated

  on eks-cluster.tf line 9, in resource "aws_iam_role" "demo-cluster":
   9:   name = "${var.cluster-name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 47 more similar warnings elsewhere)


Warning: Quoted references are deprecated

  on eks-cluster.tf line 91, in resource "aws_eks_cluster" "demo":
  91:     "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",

In this context, references are expected literally rather than in quotes.
Terraform 0.11 and earlier required quotes, but quoted references are now
deprecated and will be removed in a future version of Terraform. Remove the
quotes surrounding this reference to silence this warning.

(and 3 more similar warnings elsewhere)


Warning: Quoted type constraints are deprecated

  on variables.tf line 4, in variable "cluster-name":
   4:   type    = "string"

Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".


terraform apply
Running apply in the remote backend. Output will stream here. Pressing Ctrl-C
will cancel the remote apply if it's still pending. If the apply started it
will stop streaming the logs, but will not stop the apply running remotely.

Preparing the remote apply...

To view this run in a browser, visit:
https://app.terraform.io/app/domain-docc/docc/runs/run-3qUfoxA7NRpzbMmg

Waiting for the plan to start...

Terraform v0.12.21
Configuring remote state backend...
Initializing Terraform configuration...
2020/02/28 11:09:20 [DEBUG] Using modified User-Agent: Terraform/0.12.21 TFC/9836ec2a1f
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.http.workstation-external-ip: Refreshing state...
data.aws_region.current: Refreshing state...
data.aws_availability_zones.available: Refreshing state...
data.aws_eks_cluster_auth.eks_auth: Refreshing state...
aws_vpc.demo: Refreshing state... [id=vpc-04f951ecc8dee2cee]
aws_security_group.demo-node: Refreshing state... [id=sg-0fce75d5966b1449a]
aws_internet_gateway.demo: Refreshing state... [id=igw-0dd83896726157d0d]
aws_security_group.demo-cluster: Refreshing state... [id=sg-08b946c8c628460d1]
aws_subnet.demo[0]: Refreshing state... [id=subnet-09802275857fb1f3f]
aws_route_table.demo: Refreshing state... [id=rtb-0fb070a2acdc5c91a]
aws_security_group_rule.demo-node-ingress-self: Refreshing state... [id=sgrule-3578408565]
aws_security_group_rule.demo-cluster-ingress-node-https: Refreshing state... [id=sgrule-2830978287]
aws_security_group_rule.demo-node-ingress-cluster: Refreshing state... [id=sgrule-722372936]
aws_security_group_rule.demo-cluster-ingress-workstation-https: Refreshing state... [id=sgrule-1755175700]
data.aws_ami.eks-worker: Refreshing state...
data.helm_repository.stable: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
  ~ update in-place
-/+ destroy and then create replacement
+/- create replacement and then destroy
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_ami.eks-worker will be read during apply
  # (config refers to values not yet known)
 <= data "aws_ami" "eks-worker"  {
      + architecture          = (known after apply)
      + block_device_mappings = (known after apply)
      + creation_date         = (known after apply)
      + description           = (known after apply)
      + hypervisor            = (known after apply)
      + id                    = (known after apply)
      + image_id              = (known after apply)
      + image_location        = (known after apply)
      + image_owner_alias     = (known after apply)
      + image_type            = (known after apply)
      + kernel_id             = (known after apply)
      + most_recent           = true
      + name                  = (known after apply)
      + owner_id              = (known after apply)
      + owners                = [
          + "602401143452",
        ]
      + platform              = (known after apply)
      + product_codes         = (known after apply)
      + public                = (known after apply)
      + ramdisk_id            = (known after apply)
      + root_device_name      = (known after apply)
      + root_device_type      = (known after apply)
      + root_snapshot_id      = (known after apply)
      + sriov_net_support     = (known after apply)
      + state                 = (known after apply)
      + state_reason          = (known after apply)
      + tags                  = (known after apply)
      + virtualization_type   = (known after apply)

      + filter {
          + name   = "name"
          + values = [
              + "amazon-eks-node-1.14-v*",
            ]
        }
    }

  # data.template_file.kubeconfig will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "kubeconfig"  {
      + id       = (known after apply)
      + rendered = (known after apply)
      + template = <<~EOT
            apiVersion: v1
            kind: Config
            clusters:
            - cluster:
                server: ${endpoint}
                certificate-authority-data: ${cluster_ca}
              name: kubernetes
            contexts:
            - context:
                cluster: kubernetes
                user: aws
              name: aws
            current-context: aws
            preferences: {}
            users:
            - name: aws
              user:
                exec:
                  apiVersion: client.authentication.k8s.io/v1alpha1
                  command: aws-iam-authenticator
                  args:
                    - "token"
                    - "-i"
                    - "${cluster_name}"
        EOT
      + vars     = {
          + "cluster_ca"   = (known after apply)
          + "cluster_name" = "eks-docc"
          + "endpoint"     = (known after apply)
        }
    }

  # aws_autoscaling_group.demo will be created
  + resource "aws_autoscaling_group" "demo" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 2
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = (known after apply)
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + load_balancers            = (known after apply)
      + max_size                  = 16
      + metrics_granularity       = "1Minute"
      + min_size                  = 2
      + name                      = (known after apply)
      + name_prefix               = "eks-docc"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + target_group_arns         = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"

      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "com.domain.plex.eks.eks-docc"
        }
      + tag {
          + key                 = "kubernetes.io/cluster/eks-docc"
          + propagate_at_launch = true
          + value               = "owned"
        }
    }

  # aws_eks_cluster.demo will be created
  + resource "aws_eks_cluster" "demo" {
      + arn                       = (known after apply)
      + certificate_authority     = (known after apply)
      + created_at                = (known after apply)
      + enabled_cluster_log_types = [
          + "api",
          + "audit",
        ]
      + endpoint                  = (known after apply)
      + id                        = (known after apply)
      + identity                  = (known after apply)
      + name                      = "eks-docc"
      + platform_version          = (known after apply)
      + role_arn                  = (known after apply)
      + status                    = (known after apply)
      + tags                      = {
          + "Name" = "com.domain.plex.eks.eks-docc"
        }
      + version                   = "1.14"

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = false
          + endpoint_public_access    = true
          + public_access_cidrs       = (known after apply)
          + security_group_ids        = (known after apply)
          + subnet_ids                = (known after apply)
          + vpc_id                    = (known after apply)
        }
    }

  # aws_iam_instance_profile.demo-node will be created
  + resource "aws_iam_instance_profile" "demo-node" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "eks-docc"
      + path        = "/"
      + role        = "eks-docc-node"
      + roles       = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.demo-cluster will be created
  + resource "aws_iam_role" "demo-cluster" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-docc"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role.demo-node will be created
  + resource "aws_iam_role" "demo-node" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-docc-node"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSClusterPolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = "eks-docc"
    }

  # aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSServicePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
      + role       = "eks-docc"
    }

  # aws_iam_role_policy_attachment.demo-node-AmazonEC2ContainerRegistryReadOnly will be created
  + resource "aws_iam_role_policy_attachment" "demo-node-AmazonEC2ContainerRegistryReadOnly" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      + role       = "eks-docc-node"
    }

  # aws_iam_role_policy_attachment.demo-node-AmazonEKSWorkerNodePolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKSWorkerNodePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      + role       = "eks-docc-node"
    }

  # aws_iam_role_policy_attachment.demo-node-AmazonEKS_CNI_Policy will be created
  + resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKS_CNI_Policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      + role       = "eks-docc-node"
    }

  # aws_internet_gateway.demo will be updated in-place
  ~ resource "aws_internet_gateway" "demo" {
        id       = "igw-0dd83896726157d0d"
        owner_id = "767577325483"
        tags     = {
            "Name" = "eks-docc"
        }
      ~ vpc_id   = "vpc-04f951ecc8dee2cee" -> (known after apply)
    }

  # aws_launch_configuration.demo will be created
  + resource "aws_launch_configuration" "demo" {
      + arn                         = (known after apply)
      + associate_public_ip_address = true
      + ebs_optimized               = (known after apply)
      + enable_monitoring           = true
      + iam_instance_profile        = (known after apply)
      + id                          = (known after apply)
      + image_id                    = (known after apply)
      + instance_type               = "t2.small"
      + key_name                    = (known after apply)
      + name                        = (known after apply)
      + name_prefix                 = "eks-docc"
      + security_groups             = (known after apply)
      + user_data_base64            = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_route_table.demo must be replaced
-/+ resource "aws_route_table" "demo" {
      ~ id               = "rtb-0fb070a2acdc5c91a" -> (known after apply)
      ~ owner_id         = "767577325483" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-0dd83896726157d0d"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
      - tags             = {} -> null
      ~ vpc_id           = "vpc-04f951ecc8dee2cee" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.demo[0] will be created
  + resource "aws_route_table_association" "demo" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.demo[1] will be created
  + resource "aws_route_table_association" "demo" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.demo-cluster must be replaced
+/- resource "aws_security_group" "demo-cluster" {
      ~ arn                    = "arn:aws:ec2:eu-west-1:767577325483:security-group/sg-08b946c8c628460d1" -> (known after apply)
        description            = "Cluster communication with worker nodes"
        egress                 = [
            {
                cidr_blocks      = [
                    "0.0.0.0/0",
                ]
                description      = ""
                from_port        = 0
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "-1"
                security_groups  = []
                self             = false
                to_port          = 0
            },
        ]
      ~ id                     = "sg-08b946c8c628460d1" -> (known after apply)
      ~ ingress                = [
          - {
              - cidr_blocks      = [
                  - "3.17.165.118/32",
                ]
              - description      = "Allow workstation to communicate with the cluster API Server"
              - from_port        = 443
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 443
            },
          - {
              - cidr_blocks      = []
              - description      = "Allow pods to communicate with the cluster API Server"
              - from_port        = 443
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = [
                  - "sg-0fce75d5966b1449a",
                ]
              - self             = false
              - to_port          = 443
            },
        ] -> (known after apply)
      ~ name                   = "eks-docc20200228110052492100000002" -> (known after apply)
        name_prefix            = "eks-docc"
      ~ owner_id               = "767577325483" -> (known after apply)
        revoke_rules_on_delete = false
        tags                   = {
            "Name" = "com.domain.plex.eks.eks-docc"
        }
      ~ vpc_id                 = "vpc-04f951ecc8dee2cee" -> (known after apply) # forces replacement
    }

  # aws_security_group.demo-node must be replaced
+/- resource "aws_security_group" "demo-node" {
      ~ arn                    = "arn:aws:ec2:eu-west-1:767577325483:security-group/sg-0fce75d5966b1449a" -> (known after apply)
        description            = "Security group for all nodes in the cluster"
        egress                 = [
            {
                cidr_blocks      = [
                    "0.0.0.0/0",
                ]
                description      = ""
                from_port        = 0
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "-1"
                security_groups  = []
                self             = false
                to_port          = 0
            },
        ]
      ~ id                     = "sg-0fce75d5966b1449a" -> (known after apply)
      ~ ingress                = [
          - {
              - cidr_blocks      = []
              - description      = "Allow node to communicate with each other"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = true
              - to_port          = 0
            },
          - {
              - cidr_blocks      = []
              - description      = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
              - from_port        = 1025
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = [
                  - "sg-08b946c8c628460d1",
                ]
              - self             = false
              - to_port          = 65535
            },
        ] -> (known after apply)
      ~ name                   = "eks-docc20200228110052490700000001" -> (known after apply)
        name_prefix            = "eks-docc"
      ~ owner_id               = "767577325483" -> (known after apply)
        revoke_rules_on_delete = false
        tags                   = {
            "Name"                           = "com.domain.plex.eks.eks-docc"
            "kubernetes.io/cluster/eks-docc" = "owned"
        }
      ~ vpc_id                 = "vpc-04f951ecc8dee2cee" -> (known after apply) # forces replacement
    }

  # aws_security_group_rule.demo-cluster-ingress-node-https must be replaced
-/+ resource "aws_security_group_rule" "demo-cluster-ingress-node-https" {
      - cidr_blocks              = [] -> null
        description              = "Allow pods to communicate with the cluster API Server"
        from_port                = 443
      ~ id                       = "sgrule-2830978287" -> (known after apply)
      - ipv6_cidr_blocks         = [] -> null
      - prefix_list_ids          = [] -> null
        protocol                 = "tcp"
      ~ security_group_id        = "sg-08b946c8c628460d1" -> (known after apply) # forces replacement
        self                     = false
      ~ source_security_group_id = "sg-0fce75d5966b1449a" -> (known after apply) # forces replacement
        to_port                  = 443
        type                     = "ingress"
    }

  # aws_security_group_rule.demo-cluster-ingress-workstation-https must be replaced
-/+ resource "aws_security_group_rule" "demo-cluster-ingress-workstation-https" {
      ~ cidr_blocks              = [ # forces replacement
          - "3.17.165.118/32",
          + "3.15.14.98/32",
        ]
        description              = "Allow workstation to communicate with the cluster API Server"
        from_port                = 443
      ~ id                       = "sgrule-1755175700" -> (known after apply)
      - ipv6_cidr_blocks         = [] -> null
      - prefix_list_ids          = [] -> null
        protocol                 = "tcp"
      ~ security_group_id        = "sg-08b946c8c628460d1" -> (known after apply) # forces replacement
        self                     = false
      + source_security_group_id = (known after apply)
        to_port                  = 443
        type                     = "ingress"
    }

  # aws_security_group_rule.demo-node-ingress-cluster must be replaced
-/+ resource "aws_security_group_rule" "demo-node-ingress-cluster" {
      - cidr_blocks              = [] -> null
        description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
        from_port                = 1025
      ~ id                       = "sgrule-722372936" -> (known after apply)
      - ipv6_cidr_blocks         = [] -> null
      - prefix_list_ids          = [] -> null
        protocol                 = "tcp"
      ~ security_group_id        = "sg-0fce75d5966b1449a" -> (known after apply) # forces replacement
        self                     = false
      ~ source_security_group_id = "sg-08b946c8c628460d1" -> (known after apply) # forces replacement
        to_port                  = 65535
        type                     = "ingress"
    }

  # aws_security_group_rule.demo-node-ingress-self must be replaced
-/+ resource "aws_security_group_rule" "demo-node-ingress-self" {
      - cidr_blocks              = [] -> null
        description              = "Allow node to communicate with each other"
        from_port                = 0
      ~ id                       = "sgrule-3578408565" -> (known after apply)
      - ipv6_cidr_blocks         = [] -> null
      - prefix_list_ids          = [] -> null
        protocol                 = "-1"
      ~ security_group_id        = "sg-0fce75d5966b1449a" -> (known after apply) # forces replacement
        self                     = false
      ~ source_security_group_id = "sg-0fce75d5966b1449a" -> (known after apply) # forces replacement
      ~ to_port                  = 0 -> 65535
        type                     = "ingress"
    }

  # aws_subnet.demo[0] must be replaced
+/- resource "aws_subnet" "demo" {
      ~ arn                             = "arn:aws:ec2:eu-west-1:767577325483:subnet/subnet-09802275857fb1f3f" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "eu-west-1a"
      ~ availability_zone_id            = "euw1-az3" -> (known after apply)
        cidr_block                      = "10.0.0.0/24"
      ~ id                              = "subnet-09802275857fb1f3f" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "767577325483" -> (known after apply)
        tags                            = {
            "Name"                           = "com.domain.plex.eks.eks-docc"
            "kubernetes.io/cluster/eks-docc" = "shared"
        }
      ~ vpc_id                          = "vpc-04f951ecc8dee2cee" -> (known after apply) # forces replacement
    }

  # aws_subnet.demo[1] will be created
  + resource "aws_subnet" "demo" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "eu-west-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"                           = "com.domain.plex.eks.eks-docc"
          + "kubernetes.io/cluster/eks-docc" = "shared"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.demo must be replaced
+/- resource "aws_vpc" "demo" {
      ~ arn                              = "arn:aws:ec2:eu-west-1:767577325483:vpc/vpc-04f951ecc8dee2cee" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/24" -> "10.0.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-0afe263c40e8e5c0e" -> (known after apply)
      ~ default_route_table_id           = "rtb-0383d9a8282bd6d7b" -> (known after apply)
      ~ default_security_group_id        = "sg-0a9054ac10c1cdf9e" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-83155ee5" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-04f951ecc8dee2cee" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0383d9a8282bd6d7b" -> (known after apply)
      ~ owner_id                         = "767577325483" -> (known after apply)
        tags                             = {
            "Name"                           = "com.domain.plex.eks.eks-docc"
            "kubernetes.io/cluster/eks-docc" = "shared"
        }
    }

  # kubernetes_cluster_role_binding.tiller_rb will be created
  + resource "kubernetes_cluster_role_binding" "tiller_rb" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "tiller"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }

      + role_ref {
          + api_group = "rbac.authorization.k8s.io"
          + kind      = "ClusterRole"
          + name      = "cluster-admin"
        }

      + subject {
          + api_group = (known after apply)
          + kind      = "ServiceAccount"
          + name      = "tiller"
          + namespace = "kube-system"
        }
    }

  # kubernetes_service_account.tiller_sa will be created
  + resource "kubernetes_service_account" "tiller_sa" {
      + automount_service_account_token = true
      + default_secret_name             = (known after apply)
      + id                              = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "tiller"
          + namespace        = "kube-system"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }
    }

  # local_file.kubeconfig will be created
  + resource "local_file" "kubeconfig" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./creds/config"
      + id                   = (known after apply)
    }

Plan: 26 to add, 1 to change, 9 to destroy.

Warning: Interpolation-only expressions are deprecated

  on eks-cluster.tf line 9, in resource "aws_iam_role" "demo-cluster":
   9:   name = "${var.cluster-name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 47 more similar warnings elsewhere)


Warning: Quoted references are deprecated

  on eks-cluster.tf line 91, in resource "aws_eks_cluster" "demo":
  91:     "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",

In this context, references are expected literally rather than in quotes.
Terraform 0.11 and earlier required quotes, but quoted references are now
deprecated and will be removed in a future version of Terraform. Remove the
quotes surrounding this reference to silence this warning.

(and 3 more similar warnings elsewhere)


Warning: Quoted type constraints are deprecated

  on variables.tf line 4, in variable "cluster-name":
   4:   type    = "string"

Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".


Do you want to perform these actions in workspace "docc"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_security_group_rule.demo-cluster-ingress-node-https: Destroying... [id=sgrule-2830978287]
aws_security_group_rule.demo-cluster-ingress-workstation-https: Destroying... [id=sgrule-1755175700]
aws_security_group_rule.demo-node-ingress-cluster: Destroying... [id=sgrule-722372936]
aws_security_group_rule.demo-node-ingress-self: Destroying... [id=sgrule-3578408565]
aws_route_table.demo: Destroying... [id=rtb-0fb070a2acdc5c91a]
aws_iam_role.demo-cluster: Creating...
aws_iam_role.demo-node: Creating...
aws_vpc.demo: Creating...
aws_iam_role.demo-node: Creation complete after 1s [id=eks-docc-node]
aws_iam_instance_profile.demo-node: Creating...
aws_iam_role_policy_attachment.demo-node-AmazonEKS_CNI_Policy: Creating...
aws_iam_role_policy_attachment.demo-node-AmazonEKSWorkerNodePolicy: Creating...
aws_iam_role.demo-cluster: Creation complete after 1s [id=eks-docc]
aws_iam_role_policy_attachment.demo-node-AmazonEC2ContainerRegistryReadOnly: Creating...
aws_iam_role_policy_attachment.demo-node-AmazonEC2ContainerRegistryReadOnly: Creation complete after 0s [id=eks-docc-node-20200228111035705600000003]
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy: Creating...
aws_iam_role_policy_attachment.demo-node-AmazonEKSWorkerNodePolicy: Creation complete after 0s [id=eks-docc-node-20200228111035704000000002]
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy: Creating...
aws_iam_role_policy_attachment.demo-node-AmazonEKS_CNI_Policy: Creation complete after 0s [id=eks-docc-node-20200228111035721100000004]
aws_iam_instance_profile.demo-node: Creation complete after 0s [id=eks-docc20200228111035595300000001]
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy: Creation complete after 0s [id=eks-docc-20200228111035881800000005]
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy: Creation complete after 0s [id=eks-docc-20200228111035883500000006]
aws_security_group_rule.demo-node-ingress-cluster: Destruction complete after 1s
aws_security_group_rule.demo-cluster-ingress-node-https: Destruction complete after 1s
aws_route_table.demo: Destruction complete after 2s
aws_security_group_rule.demo-cluster-ingress-workstation-https: Destruction complete after 2s
aws_security_group_rule.demo-node-ingress-self: Destruction complete after 2s
aws_vpc.demo: Creation complete after 6s [id=vpc-06d5e9cd1a4b549da]
aws_security_group.demo-node: Creating...
aws_subnet.demo[0]: Creating...
aws_subnet.demo[1]: Creating...
aws_internet_gateway.demo: Modifying... [id=igw-0dd83896726157d0d]
aws_security_group.demo-cluster: Creating...
aws_subnet.demo[1]: Creation complete after 2s [id=subnet-013befb17e99f80ad]
aws_subnet.demo[0]: Creation complete after 2s [id=subnet-00067af8637e4706e]
aws_security_group.demo-cluster: Creation complete after 4s [id=sg-0722e46c750daa941]
aws_security_group.demo-node: Creation complete after 4s [id=sg-09689800605f6fc1a]
aws_eks_cluster.demo: Creating...
aws_security_group_rule.demo-cluster-ingress-node-https: Creating...
aws_security_group_rule.demo-node-ingress-self: Creating...
aws_security_group_rule.demo-node-ingress-cluster: Creating...
aws_security_group_rule.demo-cluster-ingress-workstation-https: Creating...
aws_security_group_rule.demo-cluster-ingress-workstation-https: Creation complete after 1s [id=sgrule-837485293]
aws_security_group_rule.demo-node-ingress-self: Creation complete after 1s [id=sgrule-3040331480]
aws_security_group_rule.demo-cluster-ingress-node-https: Creation complete after 2s [id=sgrule-1984704192]
aws_security_group_rule.demo-node-ingress-cluster: Creation complete after 2s [id=sgrule-2010769882]
aws_internet_gateway.demo: Still modifying... [id=igw-0dd83896726157d0d, 10s elapsed]
aws_internet_gateway.demo: Modifications complete after 11s [id=igw-0dd83896726157d0d]
aws_route_table.demo: Creating...
aws_route_table.demo: Creation complete after 2s [id=rtb-03545a830df34ddfe]
aws_route_table_association.demo[0]: Creating...
aws_route_table_association.demo[1]: Creating...
aws_eks_cluster.demo: Still creating... [10s elapsed]
aws_route_table_association.demo[0]: Creation complete after 1s [id=rtbassoc-057bc6fa12d56f5f1]
aws_route_table_association.demo[1]: Creation complete after 1s [id=rtbassoc-01bdb886147ebf4b3]
aws_eks_cluster.demo: Still creating... [20s elapsed]
aws_eks_cluster.demo: Still creating... [30s elapsed]
aws_eks_cluster.demo: Still creating... [40s elapsed]
aws_eks_cluster.demo: Still creating... [50s elapsed]
aws_eks_cluster.demo: Still creating... [1m0s elapsed]
aws_eks_cluster.demo: Still creating... [1m10s elapsed]
aws_eks_cluster.demo: Still creating... [1m20s elapsed]
aws_eks_cluster.demo: Still creating... [1m30s elapsed]
aws_eks_cluster.demo: Still creating... [1m40s elapsed]
aws_eks_cluster.demo: Still creating... [1m50s elapsed]
aws_eks_cluster.demo: Still creating... [2m0s elapsed]
aws_eks_cluster.demo: Still creating... [2m10s elapsed]
aws_eks_cluster.demo: Still creating... [2m20s elapsed]
aws_eks_cluster.demo: Still creating... [2m30s elapsed]
aws_eks_cluster.demo: Still creating... [2m40s elapsed]
aws_eks_cluster.demo: Still creating... [2m50s elapsed]
aws_eks_cluster.demo: Still creating... [3m0s elapsed]
aws_eks_cluster.demo: Still creating... [3m10s elapsed]
aws_eks_cluster.demo: Still creating... [3m20s elapsed]
aws_eks_cluster.demo: Still creating... [3m30s elapsed]
aws_eks_cluster.demo: Still creating... [3m40s elapsed]
aws_eks_cluster.demo: Still creating... [3m50s elapsed]
aws_eks_cluster.demo: Still creating... [4m0s elapsed]
aws_eks_cluster.demo: Still creating... [4m10s elapsed]
aws_eks_cluster.demo: Still creating... [4m20s elapsed]
aws_eks_cluster.demo: Still creating... [4m30s elapsed]
aws_eks_cluster.demo: Still creating... [4m40s elapsed]
aws_eks_cluster.demo: Still creating... [4m50s elapsed]
aws_eks_cluster.demo: Still creating... [5m0s elapsed]
aws_eks_cluster.demo: Still creating... [5m10s elapsed]
aws_eks_cluster.demo: Still creating... [5m20s elapsed]
aws_eks_cluster.demo: Still creating... [5m30s elapsed]
aws_eks_cluster.demo: Still creating... [5m40s elapsed]
aws_eks_cluster.demo: Still creating... [5m50s elapsed]
aws_eks_cluster.demo: Still creating... [6m0s elapsed]
aws_eks_cluster.demo: Still creating... [6m10s elapsed]
aws_eks_cluster.demo: Still creating... [6m20s elapsed]
aws_eks_cluster.demo: Still creating... [6m30s elapsed]
aws_eks_cluster.demo: Still creating... [6m40s elapsed]
aws_eks_cluster.demo: Still creating... [6m50s elapsed]
aws_eks_cluster.demo: Still creating... [7m0s elapsed]
aws_eks_cluster.demo: Still creating... [7m10s elapsed]
aws_eks_cluster.demo: Still creating... [7m20s elapsed]
aws_eks_cluster.demo: Still creating... [7m30s elapsed]
aws_eks_cluster.demo: Still creating... [7m40s elapsed]
aws_eks_cluster.demo: Still creating... [7m50s elapsed]
aws_eks_cluster.demo: Still creating... [8m0s elapsed]
aws_eks_cluster.demo: Still creating... [8m10s elapsed]
aws_eks_cluster.demo: Still creating... [8m20s elapsed]
aws_eks_cluster.demo: Still creating... [8m30s elapsed]
aws_eks_cluster.demo: Still creating... [8m40s elapsed]
aws_eks_cluster.demo: Still creating... [8m50s elapsed]
aws_eks_cluster.demo: Still creating... [9m0s elapsed]
aws_eks_cluster.demo: Still creating... [9m10s elapsed]
aws_eks_cluster.demo: Still creating... [9m20s elapsed]
aws_eks_cluster.demo: Still creating... [9m30s elapsed]
aws_eks_cluster.demo: Still creating... [9m40s elapsed]
aws_eks_cluster.demo: Still creating... [9m50s elapsed]
aws_eks_cluster.demo: Still creating... [10m0s elapsed]
aws_eks_cluster.demo: Still creating... [10m10s elapsed]
aws_eks_cluster.demo: Still creating... [10m20s elapsed]
aws_eks_cluster.demo: Still creating... [10m30s elapsed]
aws_eks_cluster.demo: Still creating... [10m40s elapsed]
aws_eks_cluster.demo: Still creating... [10m50s elapsed]
aws_eks_cluster.demo: Creation complete after 10m58s [id=eks-docc]
data.template_file.kubeconfig: Refreshing state...
data.aws_ami.eks-worker: Refreshing state...
local_file.kubeconfig: Creating...
local_file.kubeconfig: Creation complete after 0s [id=74e9f7179731c461d22876f3675e3b5f5b0175ac]
kubernetes_service_account.tiller_sa: Creating...
aws_launch_configuration.demo: Creating...
aws_launch_configuration.demo: Creation complete after 2s [id=eks-docc20200228112143714900000009]
aws_autoscaling_group.demo: Creating...
kubernetes_service_account.tiller_sa: Still creating... [10s elapsed]
aws_autoscaling_group.demo: Still creating... [10s elapsed]
kubernetes_service_account.tiller_sa: Still creating... [20s elapsed]
aws_autoscaling_group.demo: Still creating... [20s elapsed]
kubernetes_service_account.tiller_sa: Still creating... [30s elapsed]
aws_autoscaling_group.demo: Still creating... [30s elapsed]
aws_autoscaling_group.demo: Still creating... [40s elapsed]
aws_autoscaling_group.demo: Creation complete after 40s [id=eks-docc2020022811214486630000000a]
aws_security_group.demo-node: Destroying... [id=sg-0fce75d5966b1449a]
aws_security_group.demo-node: Destruction complete after 1s

Warning: Interpolation-only expressions are deprecated

  on eks-cluster.tf line 9, in resource "aws_iam_role" "demo-cluster":
   9:   name = "${var.cluster-name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 47 more similar warnings elsewhere)


Warning: Quoted references are deprecated

  on eks-cluster.tf line 91, in resource "aws_eks_cluster" "demo":
  91:     "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",

In this context, references are expected literally rather than in quotes.
Terraform 0.11 and earlier required quotes, but quoted references are now
deprecated and will be removed in a future version of Terraform. Remove the
quotes surrounding this reference to silence this warning.

(and 3 more similar warnings elsewhere)


Warning: Quoted type constraints are deprecated

  on variables.tf line 4, in variable "cluster-name":
   4:   type    = "string"

Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".


Error: Post https://DAEC9CA95E6D8C04D7910F37F3F35E7F.sk1.eu-west-1.eks.amazonaws.com/api/v1/namespaces/kube-system/serviceaccounts: dial tcp 34.245.242.46:443: i/o timeout

  on k8s.tf line 15, in resource "kubernetes_service_account" "tiller_sa":
  15: resource "kubernetes_service_account" "tiller_sa" {

terraform apply
Running apply in the remote backend. Output will stream here. Pressing Ctrl-C
will cancel the remote apply if it's still pending. If the apply started it
will stop streaming the logs, but will not stop the apply running remotely.

Preparing the remote apply...

To view this run in a browser, visit:
https://app.terraform.io/app/domain-docc/docc/runs/run-vqopnjWtdpuKXjDB

Waiting for the plan to start...

Terraform v0.12.21
Configuring remote state backend...
Initializing Terraform configuration...
2020/02/28 11:23:43 [DEBUG] Using modified User-Agent: Terraform/0.12.21 TFC/9836ec2a1f
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.http.workstation-external-ip: Refreshing state...
aws_iam_role.demo-node: Refreshing state... [id=eks-docc-node]
aws_subnet.demo[0]: Refreshing state... [id=subnet-09802275857fb1f3f]
aws_vpc.demo: Refreshing state... [id=vpc-06d5e9cd1a4b549da]
data.aws_region.current: Refreshing state...
aws_iam_role.demo-cluster: Refreshing state... [id=eks-docc]
aws_vpc.demo: Refreshing state... [id=vpc-04f951ecc8dee2cee]
data.aws_availability_zones.available: Refreshing state...
data.aws_eks_cluster_auth.eks_auth: Refreshing state...
aws_security_group.demo-cluster: Refreshing state... [id=sg-08b946c8c628460d1]
aws_iam_role_policy_attachment.demo-node-AmazonEKSWorkerNodePolicy: Refreshing state... [id=eks-docc-node-20200228111035704000000002]
aws_iam_role_policy_attachment.demo-node-AmazonEC2ContainerRegistryReadOnly: Refreshing state... [id=eks-docc-node-20200228111035705600000003]
aws_iam_role_policy_attachment.demo-node-AmazonEKS_CNI_Policy: Refreshing state... [id=eks-docc-node-20200228111035721100000004]
aws_iam_instance_profile.demo-node: Refreshing state... [id=eks-docc20200228111035595300000001]
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy: Refreshing state... [id=eks-docc-20200228111035883500000006]
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy: Refreshing state... [id=eks-docc-20200228111035881800000005]
aws_security_group.demo-cluster: Refreshing state... [id=sg-0722e46c750daa941]
aws_internet_gateway.demo: Refreshing state... [id=igw-0dd83896726157d0d]
aws_subnet.demo[1]: Refreshing state... [id=subnet-013befb17e99f80ad]
aws_subnet.demo[0]: Refreshing state... [id=subnet-00067af8637e4706e]
aws_security_group.demo-node: Refreshing state... [id=sg-09689800605f6fc1a]
aws_route_table.demo: Refreshing state... [id=rtb-03545a830df34ddfe]
aws_security_group_rule.demo-node-ingress-self: Refreshing state... [id=sgrule-3040331480]
aws_security_group_rule.demo-cluster-ingress-node-https: Refreshing state... [id=sgrule-1984704192]
aws_security_group_rule.demo-node-ingress-cluster: Refreshing state... [id=sgrule-2010769882]
aws_security_group_rule.demo-cluster-ingress-workstation-https: Refreshing state... [id=sgrule-837485293]
aws_eks_cluster.demo: Refreshing state... [id=eks-docc]
data.template_file.kubeconfig: Refreshing state...
aws_route_table_association.demo[0]: Refreshing state... [id=rtbassoc-057bc6fa12d56f5f1]
aws_route_table_association.demo[1]: Refreshing state... [id=rtbassoc-01bdb886147ebf4b3]
data.aws_ami.eks-worker: Refreshing state...
local_file.kubeconfig: Refreshing state... [id=74e9f7179731c461d22876f3675e3b5f5b0175ac]
aws_launch_configuration.demo: Refreshing state... [id=eks-docc20200228112143714900000009]
aws_autoscaling_group.demo: Refreshing state... [id=eks-docc2020022811214486630000000a]
data.helm_repository.stable: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
  - destroy
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_security_group.demo-cluster (deposed object 6602015d) will be destroyed
  - resource "aws_security_group" "demo-cluster" {
      - arn                    = "arn:aws:ec2:eu-west-1:767577325483:security-group/sg-08b946c8c628460d1" -> null
      - description            = "Cluster communication with worker nodes" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-08b946c8c628460d1" -> null
      - ingress                = [] -> null
      - name                   = "eks-docc20200228110052492100000002" -> null
      - name_prefix            = "eks-docc" -> null
      - owner_id               = "767577325483" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Name" = "com.domain.plex.eks.eks-docc"
        } -> null
      - vpc_id                 = "vpc-04f951ecc8dee2cee" -> null
    }

  # aws_security_group_rule.demo-cluster-ingress-workstation-https must be replaced
-/+ resource "aws_security_group_rule" "demo-cluster-ingress-workstation-https" {
      ~ cidr_blocks              = [ # forces replacement
          - "3.15.14.98/32",
          + "18.189.192.110/32",
        ]
        description              = "Allow workstation to communicate with the cluster API Server"
        from_port                = 443
      ~ id                       = "sgrule-837485293" -> (known after apply)
      - ipv6_cidr_blocks         = [] -> null
      - prefix_list_ids          = [] -> null
        protocol                 = "tcp"
        security_group_id        = "sg-0722e46c750daa941"
        self                     = false
      + source_security_group_id = (known after apply)
        to_port                  = 443
        type                     = "ingress"
    }

  # aws_subnet.demo[0] (deposed object 2042be4a) will be destroyed
  - resource "aws_subnet" "demo" {
      - arn                             = "arn:aws:ec2:eu-west-1:767577325483:subnet/subnet-09802275857fb1f3f" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "eu-west-1a" -> null
      - availability_zone_id            = "euw1-az3" -> null
      - cidr_block                      = "10.0.0.0/24" -> null
      - id                              = "subnet-09802275857fb1f3f" -> null
      - map_public_ip_on_launch         = false -> null
      - owner_id                        = "767577325483" -> null
      - tags                            = {
          - "Name"                           = "com.domain.plex.eks.eks-docc"
          - "kubernetes.io/cluster/eks-docc" = "shared"
        } -> null
      - vpc_id                          = "vpc-04f951ecc8dee2cee" -> null
    }

  # aws_vpc.demo (deposed object c16c479a) will be destroyed
  - resource "aws_vpc" "demo" {
      - arn                              = "arn:aws:ec2:eu-west-1:767577325483:vpc/vpc-04f951ecc8dee2cee" -> null
      - assign_generated_ipv6_cidr_block = false -> null
      - cidr_block                       = "10.0.0.0/24" -> null
      - default_network_acl_id           = "acl-0afe263c40e8e5c0e" -> null
      - default_route_table_id           = "rtb-0383d9a8282bd6d7b" -> null
      - default_security_group_id        = "sg-0a9054ac10c1cdf9e" -> null
      - dhcp_options_id                  = "dopt-83155ee5" -> null
      - enable_classiclink               = false -> null
      - enable_classiclink_dns_support   = false -> null
      - enable_dns_hostnames             = false -> null
      - enable_dns_support               = true -> null
      - id                               = "vpc-04f951ecc8dee2cee" -> null
      - instance_tenancy                 = "default" -> null
      - main_route_table_id              = "rtb-0383d9a8282bd6d7b" -> null
      - owner_id                         = "767577325483" -> null
      - tags                             = {
          - "Name"                           = "com.domain.plex.eks.eks-docc"
          - "kubernetes.io/cluster/eks-docc" = "shared"
        } -> null
    }

  # kubernetes_cluster_role_binding.tiller_rb will be created
  + resource "kubernetes_cluster_role_binding" "tiller_rb" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "tiller"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }

      + role_ref {
          + api_group = "rbac.authorization.k8s.io"
          + kind      = "ClusterRole"
          + name      = "cluster-admin"
        }

      + subject {
          + api_group = (known after apply)
          + kind      = "ServiceAccount"
          + name      = "tiller"
          + namespace = "kube-system"
        }
    }

  # kubernetes_service_account.tiller_sa will be created
  + resource "kubernetes_service_account" "tiller_sa" {
      + automount_service_account_token = true
      + default_secret_name             = (known after apply)
      + id                              = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "tiller"
          + namespace        = "kube-system"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }
    }

  # local_file.kubeconfig will be created
  + resource "local_file" "kubeconfig" {
      + content              = <<~EOT
            apiVersion: v1
            kind: Config
            clusters:
            - cluster:
                server: https://DAEC9CA95E6D8C04D7910F37F3F35E7F.sk1.eu-west-1.eks.amazonaws.com
                certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01ESXlPREV4TVRjME1Wb1hEVE13TURJeU5URXhNVGMwTVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTW9QCmVEYTdIU0hIdkJTWjRRSk9BRjlyWWY4RG16MktwQ0g3Tm5iSHFiRWN3R2tKVFpoa053bUdzcDkzeFkxaXVaazYKL0swWkdzWXo5eVhucFdZSVRDbWg2ckQvcDYrK3BURGxFT2RoUTNJVlh1Ni9DWGZ3Rm5FVStFZGhpNllKdmwyQgo4SW5rMDRqZ2RyY0NBTHFRZlJFVXFaNDJ5S29hM0t4QjgyV0MzRERJQVBVcnNNVjNTZWpJbmdPMm9hbHdVRlQ3Ckovbk1jRHk5cDM4TGlUL0dFd0xDSk0yR29Sc2FVTFhFSnhab2czZUpvMlVQZGg1dVpXTDltYTZkVVA2MUUxMjEKL2N1eXI5RWJ5Rmp3a3VURmQ0TlZidngrQ0EvYm1MRExjUUJTd3Q4U0d1cEh3VEpBbUpsQmhnbFZWRFpML21HMApQMXVRdDc3WE9tUmhVT1Bac2JVQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFFdnI2UmtCQm5BYUo5MFpGMWxnNjRvd3lZNysKYTAxa2V4Y0pXbU1Ca2pMSXoxamtldk1lckFrQWkvVGNxeXdyOEZXV0Nmb2hhaTJremVTVmRvMk1zTEFrY0RZVAppWU5Sc1JDMlVzZnNaL3hyTnZ2T2NSZURMejAwYTZuL3ErWXJ3ZGNrUWw5WXYzcHVVUXRVbVliQnJWcFgyK3QvClRESjRQRDRLN0lpSEdESEZ3ZTVDVVFZOUJsZFBQVnF1Rm8yL056Wkk2dkozWU5lV3VLRS9kNVJrMElQMXg0UXQKbm5rclBrR01oaFgxQnpTdy9COHFPeGFTNjQ5cW5nT2ZlSEpnUFk3UkNyeHJXdnl6S25VMFEzMlF3WFloaHIwZwpScjVub0FabldIU0xFZ1crbFlnRXFVa0ZaWmE2VG55dGtDQ1FCQTlzL3dnVzk0KzNDMFNtYUNMUHBCVT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
              name: kubernetes
            contexts:
            - context:
                cluster: kubernetes
                user: aws
              name: aws
            current-context: aws
            preferences: {}
            users:
            - name: aws
              user:
                exec:
                  apiVersion: client.authentication.k8s.io/v1alpha1
                  command: aws-iam-authenticator
                  args:
                    - "token"
                    - "-i"
                    - "eks-docc"
        EOT
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./creds/config"
      + id                   = (known after apply)
    }

Plan: 4 to add, 0 to change, 4 to destroy.

Warning: Interpolation-only expressions are deprecated

  on eks-cluster.tf line 9, in resource "aws_iam_role" "demo-cluster":
   9:   name = "${var.cluster-name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 47 more similar warnings elsewhere)


Warning: Quoted references are deprecated

  on eks-cluster.tf line 91, in resource "aws_eks_cluster" "demo":
  91:     "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",

In this context, references are expected literally rather than in quotes.
Terraform 0.11 and earlier required quotes, but quoted references are now
deprecated and will be removed in a future version of Terraform. Remove the
quotes surrounding this reference to silence this warning.

(and 3 more similar warnings elsewhere)


Warning: Quoted type constraints are deprecated

  on variables.tf line 4, in variable "cluster-name":
   4:   type    = "string"

Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".


Do you want to perform these actions in workspace "docc"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

local_file.kubeconfig: Creating...
local_file.kubeconfig: Creation complete after 0s [id=74e9f7179731c461d22876f3675e3b5f5b0175ac]
aws_subnet.demo[0]: Destroying... [id=subnet-09802275857fb1f3f]
aws_security_group_rule.demo-cluster-ingress-workstation-https: Destroying... [id=sgrule-837485293]
kubernetes_service_account.tiller_sa: Creating...
aws_security_group_rule.demo-cluster-ingress-workstation-https: Destruction complete after 1s
aws_security_group_rule.demo-cluster-ingress-workstation-https: Creating...
aws_subnet.demo[0]: Destruction complete after 1s
kubernetes_service_account.tiller_sa: Creation complete after 1s [id=kube-system/tiller]
kubernetes_cluster_role_binding.tiller_rb: Creating...
kubernetes_cluster_role_binding.tiller_rb: Creation complete after 0s [id=tiller]
aws_security_group_rule.demo-cluster-ingress-workstation-https: Creation complete after 1s [id=sgrule-83822221]
aws_security_group.demo-cluster: Destroying... [id=sg-08b946c8c628460d1]
aws_security_group.demo-cluster: Destruction complete after 1s
aws_vpc.demo: Destroying... [id=vpc-04f951ecc8dee2cee]
aws_vpc.demo: Destruction complete after 1s

Warning: Interpolation-only expressions are deprecated

  on eks-cluster.tf line 9, in resource "aws_iam_role" "demo-cluster":
   9:   name = "${var.cluster-name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 47 more similar warnings elsewhere)


Warning: Quoted references are deprecated

  on eks-cluster.tf line 91, in resource "aws_eks_cluster" "demo":
  91:     "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",

In this context, references are expected literally rather than in quotes.
Terraform 0.11 and earlier required quotes, but quoted references are now
deprecated and will be removed in a future version of Terraform. Remove the
quotes surrounding this reference to silence this warning.

(and 3 more similar warnings elsewhere)


Warning: Quoted type constraints are deprecated

  on variables.tf line 4, in variable "cluster-name":
   4:   type    = "string"

Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".


Apply complete! Resources: 4 added, 0 changed, 4 destroyed.





docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: domaindocc
Password: 
Login Succeeded

docker push domaindocc/docc-sample:latest
The push refers to repository [docker.io/domaindocc/docc-sample]
22b4058de6ed: Pushed 
5769d8352d4d: Pushed 
8383599d2fdc: Pushed 
23419e186866: Mounted from library/golang 
1f6ba46a9c52: Mounted from library/golang 
968d46c1d20e: Mounted from library/golang 
b87598efb2f0: Mounted from library/golang 
f1b5933fe4b5: Mounted from library/golang 
latest: digest: sha256:96139aeed8d90772a88f7397568161a87de80d634273700644443c83d05b5f32 size: 1991


aws sts get-caller-identity
767577325483    arn:aws:iam::767577325483:user/nicola   AIDA3FNZMP6VUOU6NXKQB

aws eks --region eu-west-1 update-kubeconfig --name eks-docc

aws eks --region eu-west-1 update-kubeconfig --name eks-docc
Added new context arn:aws:eks:eu-west-1:767577325483:cluster/eks-docc to /home/z/.kube/config

