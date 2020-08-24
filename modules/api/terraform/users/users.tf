resource "aws_api_gateway_resource" "user" {
  rest_api_id = "${var.aws_api_terraform_id}"
  parent_id   = "${var.aws_api_terraform_root_resource_id}"
  path_part   = "user"
}

resource "aws_api_gateway_method" "get" {
  rest_api_id   = "${var.aws_api_terraform_id}"
  resource_id   = "${aws_api_gateway_resource.user.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "user" {
  rest_api_id             = "${var.aws_api_terraform_id}"
  resource_id             = "${aws_api_gateway_resource.user.id}"
  http_method             = "${aws_api_gateway_method.get.http_method}"
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "https://jsonplaceholder.typicode.com/users/1"
}

resource "aws_api_gateway_deployment" "user" {
  depends_on = ["aws_api_gateway_integration.user"]

  rest_api_id = "${var.aws_api_terraform_id}"
}
