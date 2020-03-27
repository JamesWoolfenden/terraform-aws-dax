resource "aws_dax_parameter_group" "example" {
  name = var.parameters_group_name

  dynamic "parameters" {
    for_each = var.params

    content {
      name  = parameters.value.name
      value = parameters.value.value
    }
  }

}
