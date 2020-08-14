module "consulta" {
  source                             = "./consulta"
  env                                = "${var.env}"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "pesquisa" {
  source                             = "./pesquisa"
  env                                = "${var.env}"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "procura" {
  source                             = "./procura"
  env                                = "${var.env}"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}
