resource "aws_api_gateway_resource" "todos" {
  rest_api_id = "${var.aws_api_terraform_id}"
  parent_id   = "${var.aws_api_terraform_root_resource_id}"
  path_part   = "todos"
}

resource "aws_api_gateway_method" "post" {
  rest_api_id   = "${var.aws_api_terraform_id}"
  resource_id   = "${aws_api_gateway_resource.todos.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "todos" {
  rest_api_id             = "${var.aws_api_terraform_id}"
  resource_id             = "${aws_api_gateway_resource.todos.id}"
  http_method             = "${aws_api_gateway_method.post.http_method}"
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "https://jsonplaceholder.typicode.com/todos"
}

resource "aws_api_gateway_deployment" "todos" {
  depends_on = ["aws_api_gateway_integration.todos"]

  rest_api_id = "${var.aws_api_terraform_id}"
}
