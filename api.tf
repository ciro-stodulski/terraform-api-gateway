resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.api_name}"
  description = "${var.api_description}"
}

resource "aws_api_gateway_resource" "this" {
  rest_api_id = "${aws_api_gateway_rest_api.this.id}"
  parent_id   = "${aws_api_gateway_rest_api.this.root_resource_id}"
  path_part   = "consulta"
}

resource "aws_api_gateway_method" "any" {
  rest_api_id   = "${aws_api_gateway_rest_api.this.id}"
  resource_id   = "${aws_api_gateway_resource.this.id}"
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id             = "${aws_api_gateway_rest_api.this.id}"
  resource_id             = "${aws_api_gateway_resource.this.id}"
  http_method             = "${aws_api_gateway_method.any.http_method}"
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "https://www.google.com"
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = ["aws_api_gateway_integration.this"]

  rest_api_id = "${aws_api_gateway_rest_api.this.id}"
  stage_name  = "${var.env}"
}
