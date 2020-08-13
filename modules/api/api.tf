resource "aws_api_gateway_rest_api" "terraform" {
  name        = "${var.api_name}"
  description = "${var.api_description}"
}

module consulta {
  source = "./resources/consulta"
  aws_api_gateway_rest_api = "${var.aws_api_gateway_rest_api}"
}

resource "aws_api_gateway_deployment" "terraform_deployment" {
  depends_on = ["aws_api_gateway_integration.this"]

  rest_api_id = "${aws_api_gateway_rest_api.terraform.id}"
  stage_name  = "${var.env}"
}
