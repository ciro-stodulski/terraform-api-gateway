provider "aws" {
  region = "${var.region}"
}

module "api_gateway" {
  source = "./modules/api"
  env    = "${var.env}"
}
