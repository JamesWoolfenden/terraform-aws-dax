module "dax" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = ["subnet-08d97e381dbc80d40", "subnet-03fdfb13a135366a7", "subnet-05a6a6de2f4989d22"]
  vpc_cidr    = ["10.0.0.0/16"]
}
