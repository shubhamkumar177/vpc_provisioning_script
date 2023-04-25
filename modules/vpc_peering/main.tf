# Below is the template of peering  "my_vpc" with another vpc. Create new vpc resource then follow the below steps.
resource "aws_vpc_peering_connection" "vpc_peering" {
    vpc_id = var.vpc_id
    peer_vpc_id = "<add vpc id>"   # Add new vpc id to which you want to peer
    auto_accept   = true
}

resource "aws_route" "route-1"{
    route_table_id = var.public_route_table_id
    destination_cidr_block = "<CIDR_BLOCK>"         # provide cidr block of the new vpc you want to peer 
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
resource "aws_route" "route-2"{
    route_table_id = var.route_table_private_1a
    destination_cidr_block = "172.16.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
resource "aws_route" "route-3"{
    route_table_id = var.route_table_private_1b
    destination_cidr_block = "172.16.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

variable "vpc_id" {
    type = string
}

variable "public_route_table_id" {
    type = string
}

variable "route_table_private_1a" {
    type = string
}

variable "route_table_private_1b" {
    type = string
}