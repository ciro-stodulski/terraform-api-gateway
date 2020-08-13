provider "aws" {
  region = "${var.region}"
  alias  = "virginia"
}

module "api_gateway" {
  source = "./modules/api"
  env    = "${var.env}"
}
