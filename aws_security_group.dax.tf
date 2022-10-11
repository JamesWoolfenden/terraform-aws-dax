resource "aws_security_group" "dax" {
    name = var.cluster["cluster_name"]
    description = "DAX cluster sg"
    ingress  {
      cidr_blocks = var.vpc_cidr
      description = "unencryted dax"
      from_port = 8111
      protocol = "tcp"
      to_port = 8111
    }

    ingress {
      cidr_blocks =  var.vpc_cidr
      description = "encryted dax"
      from_port = 9111
      protocol = "tcp"
      to_port = 9111
    }
}


variable "vpc_cidr" {
  type=list(string)
}