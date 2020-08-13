resource "aws_api_gateway_resource" "mockjson" {
  rest_api_id = "${aws_api_gateway_rest_api.terraform.id}"
  parent_id   = "${aws_api_gateway_rest_api.terraform.root_resource_id}"
  path_part   = "mockjson"
}

resource "aws_api_gateway_method" "get" {
  rest_api_id   = "${aws_api_gateway_rest_api.terraform.id}"
  resource_id   = "${aws_api_gateway_resource.mockjson.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration_mockjson" {
  rest_api_id             = "${aws_api_gateway_rest_api.terraform.id}"
  resource_id             = "${aws_api_gateway_resource.mockjson.id}"
  http_method             = "${aws_api_gateway_method.get.http_method}"
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "https://jsonplaceholder.typicode.com/todos/1"
}
