resource "aws_api_gateway_resource" "consulta" {
  rest_api_id = "${var.aws_api_terraform_id}"
  parent_id   = "${var.aws_api_terraform_root_resource_id}"
  path_part   = "consulta"
}

resource "aws_api_gateway_method" "get" {
  rest_api_id   = "${var.aws_api_terraform_id}"
  resource_id   = "${aws_api_gateway_resource.consulta.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "consulta" {
  rest_api_id             = "${var.aws_api_terraform_id}"
  resource_id             = "${aws_api_gateway_resource.consulta.id}"
  http_method             = "${aws_api_gateway_method.get.http_method}"
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "https://www.googAAAAADle.de"
}

resource "aws_api_gateway_deployment" "consulta" {
  depends_on = ["aws_api_gateway_integration.consulta"]

  rest_api_id = "${var.aws_api_terraform_id}"
  stage_name  = "${var.env}"
}
