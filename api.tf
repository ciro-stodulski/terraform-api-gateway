resource "aws_api_gateway_rest_api" "terraform" {
  name        = "terraform"
  description = "api built with terraform"
}

module "api_terraform" {
  source                             = "./modules/api/terraform"
  aws_api_terraform_id               = "${aws_api_gateway_rest_api.terraform.id}"
  aws_api_terraform_root_resource_id = "${aws_api_gateway_rest_api.terraform.root_resource_id}"
}
