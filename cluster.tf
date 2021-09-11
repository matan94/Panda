module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  cidr = var.vpc_cidr
  azs = ["${var.region}a","${var.region}b"]
  private_subnets   = var.private_subnets
  public_subnets    = var.public_subnets
  manage_default_route_table = true
  default_route_table_tags   = { DefaultRouteTable = true }
  default_route_table_routes = resource.aws_default_route_table.route_table
  map_public_ip_on_launch = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "internet_gateway"
  }
    depends_on = [
    module.vpc.vpc_id
  ]
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = module.vpc.default_route_table_id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = resource.aws_internet_gateway.internet_gateway.gateway_id
    }
  ]

  tags = {
    Name = "default_route"
  }
    depends_on = [
    resource.aws_internet_gateway.internet_gateway
  ]
}

module "eks" {
  source       = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git?ref=v17.4.0"
  cluster_version = var.cluster_version
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.private_subnets
  cluster_endpoint_private_access = true
  cluster_create_endpoint_private_access_sg_rule = true
  cluster_endpoint_private_access_cidrs = var.private_subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = var.node_desired
      max_capacity     = var.node_max
      min_capaicty     = var.node_min
      instance_types = var.node_types
    }
  }

  manage_aws_auth = false
  
  depends_on = [
  module.vpc.vpc_id
  ]
}
