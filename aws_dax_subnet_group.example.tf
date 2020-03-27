resource "aws_dax_subnet_group" "example" {
  name        = var.subnet_group_name
  description = ""
  subnet_ids  = var.subnet_ids
}
