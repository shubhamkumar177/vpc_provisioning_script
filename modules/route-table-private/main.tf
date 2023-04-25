resource "aws_route_table" "private-1a" {
vpc_id = var.vpc_id
route {
cidr_block = "0.0.0.0/0"                    
nat_gateway_id = var.nat_gateway_1a_id 
}
tags = {
Name = "private-1a"
Enviroment = "dev"
}
}
resource "aws_route_table" "private-1b" {
vpc_id = var.vpc_id
route {
cidr_block = "0.0.0.0/0"
nat_gateway_id = var.nat_gateway_1b_id
}
tags = {
Name = "private-1b"
Enviroment = "dev"
}
}

variable "vpc_id" {
type = string
}
variable "nat_gateway_1a_id" {
type = string
}

variable "nat_gateway_1b_id" {
type = string
}

output "route-table-private-1a" {
value = aws_route_table.private-1a.id
}

output "route-table-private-1b" {
value = aws_route_table.private-1b.id
}
