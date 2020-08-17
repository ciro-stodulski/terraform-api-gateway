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

module "add" {
  source                             = "./add"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "json" {
  source                             = "./json"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}

module "jsoncopy" {
  source                             = "./jsoncopy"
  aws_api_terraform_id               = "${var.aws_api_terraform_id}"
  aws_api_terraform_root_resource_id = "${var.aws_api_terraform_root_resource_id}"
}
