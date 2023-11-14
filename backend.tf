terraform {
  cloud {
    hostname = "app.terraform.io"
    organization = "teshima"
    workspaces {
      name = "terraform-aws-datalake"
    }
  }
}