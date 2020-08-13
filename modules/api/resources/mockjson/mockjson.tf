resource "aws_api_gateway_resource" "mockjson" {
  rest_api_id = "${var.aws_api_terraform_id}"
  parent_id   = "${var.aws_api_terraform_root_resource_id}"
  path_part   = "mockjson"
}

resource "aws_api_gateway_method" "get" {
  rest_api_id   = "${var.aws_api_terraform_id}"
  resource_id   = "${aws_api_gateway_resource.mockjson.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration_mockjson" {
  rest_api_id             = "${var.aws_api_terraform_id}"
  resource_id             = "${aws_api_gateway_resource.mockjson.id}"
  http_method             = "${aws_api_gateway_method.get.http_method}"
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "https://jsonplaceholder.typicode.com/todos/1"
}

resource "aws_api_gateway_deployment" "terraform_deployment" {
  depends_on = ["aws_api_gateway_integration.integration_mockjson"]

  rest_api_id = "${var.aws_api_terraform_id}"
  stage_name  = "${var.env}"
}
