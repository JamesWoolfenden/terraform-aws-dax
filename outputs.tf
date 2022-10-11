output "cluster" {
  value = aws_dax_cluster.demo
}

output "parameters" {
  value = aws_dax_parameter_group.example
}

output "subnets" {
  value = aws_dax_subnet_group.example
}

output "role" {
  value = aws_iam_role.dax
}

output "policy" {
  value = aws_iam_role_policy.dax
}
