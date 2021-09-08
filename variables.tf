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