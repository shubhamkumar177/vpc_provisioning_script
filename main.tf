module "my-vpc" {
source = "./modules/vpc"
vpc_cidr = var.vpc_cidr
vpc_name = var.vpc_name
}

module "public-subnet" {
source = "./modules/public-subnet"
vpc_id = module.my-vpc.vpc
public_subnet_1a_cidr = var.public_subnet_1a_cidr
public_subnet_1b_cidr = var.public_subnet_1b_cidr
}

module "private-subnet" {
source = "./modules/private-subnet"
vpc_id = module.my-vpc.vpc
private_subnet_1a_cidr = var.private_subnet_1a_cidr
private_subnet_1b_cidr = var.private_subnet_1b_cidr
}

module "igw" {
source = "./modules/igw"
vpc_id = module.my-vpc.vpc
}

module "nat-gateway-1a" {
source = "./modules/nat-gateway-1a"
subnet_id = module.public-subnet.public-subnet-1a
}

module "nat-gateway-1b" {
source = "./modules/nat-gateway-1b"
subnet_id = module.public-subnet.public-subnet-1b
}

module "route-table-public" {
source = "./modules/route-table-public"
vpc_id = module.my-vpc.vpc
igw_id = module.igw.igw_id
}

module "route-table-public-association" {
source = "./modules/route-table-public-association"
public_subnet_1a_id = module.public-subnet.public-subnet-1a
public_subnet_1b_id = module.public-subnet.public-subnet-1b
route_table_id = module.route-table-public.public_route_table_id
}

module "route-table-private" {
source = "./modules/route-table-private"
vpc_id = module.my-vpc.vpc
nat_gateway_1a_id = module.nat-gateway-1a.nat-gateway-1a-id 
nat_gateway_1b_id = module.nat-gateway-1b.nat-gateway-1b-id
}

module "route-table-private-association" {
source = "./modules/route-table-private-association"
private_subnet_1a_id = module.private-subnet.private-subnet-1a
private_subnet_1b_id = module.private-subnet.private-subnet-1b
route_table_private_1a = module.route-table-private.route-table-private-1a
route_table_private_1b = module.route-table-private.route-table-private-1b
}

module "security_group" {
source = "./modules/security-group"
vpc_id = module.my-vpc.vpc
}

# module "vpc_peering" {
#    source = "./modules/vpc_peering"
#    vpc_id = module.my-vpc.vpc
#    public_route_table_id = module.route-table-public.public_route_table_id
#    route_table_private_1a = module.route-table-private.route-table-private-1a
#    route_table_private_1b = module.route-table-private.route-table-private-1b
#
#}

  #   module "transit_gateway" {
  #   source = "./modules/transit_gateway"
  #   vpc_id = module.my-vpc.vpc
  #   public_subnet_1a_id = module.public-subnet.public-subnet-1a
  #}