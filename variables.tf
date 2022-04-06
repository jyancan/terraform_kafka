variable "region" {
  default = "us-east-1"
}
variable "ami_id" {
  default = {
    us-east-1    = "ami-035b3c7efe6d061d5"
    eu-west-2    = "ami-132b3c7efe6sdfdsfd"
    eu-central-1 = "ami-9787h5h6nsn75gd33"
  }
}

variable "instance_count" {
  type = map(string)

  default = {
    "rest"            = 1
    "connect"         = 1
    "ksql"            = 1
    "schema"          = 1
    "control_center"  = 1
    "broker"          = 1
    "zookeeper"       = 1
  }
}

variable "instance_prefix" {
  default     = "staging"
}


variable "aws_instance_type" {
  description = "The AWS Instance Type."
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "Key Pair"
  default     = "kafka1"
}





