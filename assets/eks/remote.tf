terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "domain-docc"

    workspaces {
      name = "docc"
    }
  }
}

