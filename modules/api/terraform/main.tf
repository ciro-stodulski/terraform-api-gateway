module "users" {
  source                             = "./users"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "todos" {
  source                             = "./todos"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}
