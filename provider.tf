terraform {
  required_providers {
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  default_tags {
    tags = {
      Owner = "teshima"
    }
  }
}

