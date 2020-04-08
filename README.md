# DevOps Code Challenge (DOCC)

The days of manually-configured infrastructure systems are over. Infrastructure needs to be provisioned and configured with code, or you will drown in support.
The root of this attitude is that a lot of manual tasks can be automated using dedicated tools like Terraform, Helm, Puppet and Chef or even with scripting languages like Python, Ruby, Go and Bash. So the question becomes what is the best way to test these skills? Potentially the present **DevOps Code Challenge (DOCC)**, that aims at assessing coding skills through a practical session on Amazon Web Services (AWS) platform, with Kubernetes as a key component.

## Requirements

## domain Docker Hub Access

To log in the domain Docker Hub, please proceed as follows:

```bash
$ docker login --username $USERNAME
```

**We shall provide you the access token when starting the DOCC.**

## Required Development Tools

It is worth point out that this coding challenge will be deployed on [Amazon Web Services (AWS)](https://aws.amazon.com/) cloud provider. The following tools will be requisite:

- [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
- [Terraform](https://www.terraform.io/)
- [Helm](https://helm.sh/)
- [Docker](https://www.docker.com/)
- [VSCode](https://code.visualstudio.com/) - optional

# Topics Covered

The main topics covered during the DOCC and the following open discussion (and quiz) are:

- Fundamentals of system and network
- Knowledge on infrastructure-as-code and scripting using [Terraform](https://www.terraform.io/) and Helm
- Microservices orchestration using Kubernetes
- Microservice observability (control versus data plane and meshing
- Containerization and serverless concepts
- Cloud-native applications
- Continuous integration/deployment/innovation tools
- Gitops and trunk-based development approach
- Distributed systems monitoring and tracing

# Main Objectives

1. Configure and deploy an [EKS cluster](https://aws.amazon.com/eks/) based on given Terraform and Kubernetes configuration maps provided in folder [`assets/eks`](./assets/eks).
Please refer to the [architecture diagram](./assets/img/docc-platform-synopsis.png) to be sure of the expected result.

2. Configure and install appropriate ingress traffic controller.

3. Containerize (using Docker), as hermetic container, the sample [Go Server](./assets/sample/server.go).
Its Docker image should be published to the domain Github repository (see [CREDENTIALS.md](./CREDENTIALS.md) file for Github token), namely:
```
DTR: domain/docc-sample
```

4. Configure, deploy (in its own Kubernetes namespace) and securize a Kubernetes Pod to operate the Go Server.

5. A new record called `service.docc.domain.io` must be configured in `Route53` DNS server on AWS.


**GOOD LUCK!!! :)**
