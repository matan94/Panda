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

variable "hw_namespace" {
	type = string
	default = "hellow_world_namespace"
}

variable "hw_pod" {
	type = string
	default = "hellow_world_pod"
}

variable "hw_image" {
	type = string
	default = "hello-world:latest"
}