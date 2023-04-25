resource "aws_route_table" "public-1a" {
vpc_id = var.vpc_id
route {
cidr_block = "0.0.0.0/0"
gateway_id = var.igw_id
}
tags = {
Name = "public-1a"
Enviroment = "dev"
}
}

output "public_route_table_id" {
value = aws_route_table.public-1a.id
}

variable "vpc_id" {
type = string
}

variable "igw_id" {
type = string
}
