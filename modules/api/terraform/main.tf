module "consulta" {
  source                             = "./consulta"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "pesquisa" {
  source                             = "./pesquisa"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "procura" {
  source                             = "./procura"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}
