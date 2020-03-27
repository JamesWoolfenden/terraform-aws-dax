resource "aws_dax_cluster" "demo" {
  cluster_name           = var.cluster["cluster_name"]
  iam_role_arn           = var.iam_role_arn
  node_type              = var.cluster["node_type"]
  replication_factor     = var.cluster["replication_factor"]
  availability_zones     = var.cluster["availability_zones"]
  description            = var.cluster["description"]
  notification_topic_arn = var.cluster["notification_topic_arn"]
  parameter_group_name   = aws_dax_parameter_group.example.name
  maintenance_window     = var.cluster["maintenance_window"]
  security_group_ids     = var.cluster["security_group_ids"]

  #checkov test required
  server_side_encryption {
    enabled = var.server_side_encryption
  }

  subnet_group_name = aws_dax_subnet_group.example.name
  tags              = var.common_tags

}
