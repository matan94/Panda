variable "hw_namespace" {
	type = string
	default = "hello_world_namespace"
}

variable "hw_name" {
	type = string
	default = "hello-world"
}

variable "hw_image" {
	type = string
	default = "tutum/hello-world:latest"
}