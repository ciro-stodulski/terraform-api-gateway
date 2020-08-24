provider "aws" {
  region = "${var.region}"
}

// Backend Storage
terraform {
  backend "s3" {}
}
