resource "aws_dax_cluster" "demo" {
  cluster_name                     = var.cluster["cluster_name"]
  iam_role_arn                     = aws_iam_role.dax.arn
  cluster_endpoint_encryption_type = "TLS"
  node_type                        = var.cluster["node_type"]
  replication_factor               = var.cluster["replication_factor"]
  availability_zones               = var.cluster["availability_zones"]
  description                      = var.cluster["description"]
  notification_topic_arn           = var.cluster["notification_topic_arn"]
  parameter_group_name             = aws_dax_parameter_group.example.name
  maintenance_window               = var.cluster["maintenance_window"]
  security_group_ids               = concat([aws_security_group.dax.id], var.cluster["security_group_ids"])

  #checkov test required
  server_side_encryption {
    enabled = true
  }

  subnet_group_name = aws_dax_subnet_group.example.name
  tags              = var.common_tags
}
