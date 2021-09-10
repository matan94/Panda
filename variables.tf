variable "region" {
	type = string
	default = "us-east-1"
}

variable "cluster_name" {
	type = string
}

variable "private_subnets" {
	type = list
}

variable "public_subnets" {
        type = list
}

variable "vpc_cidr" {
	type = string
}

variable "node_desired" {
	type = number
	default = 2
}

variable "node_max" {
	type = number
	default = 2
}

variable "node_min" {
	type  = number
        default = 2
}

variable "cluster_version" {
	type = string
	default = "1.21"
}

variable "node_types" {
	type = list
	default = ["t2.micro"]
}

variable "route_table" {
type = map(list(string))
default = { 
default_route_table_id = "rtb-0687c4482ec8b0fed"
cidr_block "0.0.0.0" }
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = "rtb-0687c4482ec8b0fed"

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = "igw-090ad5c16d112cfb4"
    }
  ]

  tags = {
    Name = "defualt_route"
  }
}