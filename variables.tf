variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "cluster" {
  default = {
    cluster_name           = "cluster-example"
    node_type              = "dax.r4.large"
    replication_factor     = 1
    availability_zones     = [""]
    description            = "Test DAX cluster"
    notification_topic_arn = ""
    maintenance_window     = "sun:05:00-sun:09:00"
    security_group_ids     = [""]
  }
}

variable "subnet_ids" {
  description = "Subnets to put the DAX cluster in"
  type        = list
  default     = [""]
}

variable "server_side_encryption" {
  description = "To set DAX as encrypted"
  type        = bool
  default     = true
}

variable "iam_role_arn" {
  default = ""
}

variable "params" {
  default = [
    {
      name  = "query-ttl-millis"
      value = "100000"
    },
    {
      name  = "record-ttl-millis"
      value = "100000"
  }]
}

variable "subnet_group_name" {
  description = "The Name of the Subnet Group"
  type        = string
  default     = "example"
}

variable "parameters_group_name" {
  description = "The Name of the parameter Group"
  type        = string
  default     = "example"
}
