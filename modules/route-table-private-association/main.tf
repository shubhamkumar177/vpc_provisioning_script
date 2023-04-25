resource "aws_route_table_association" "rt-a-3" {
subnet_id = var.private_subnet_1a_id
route_table_id = var.route_table_private_1b

}

resource "aws_route_table_association" "rt-a-4" {
subnet_id = var.private_subnet_1b_id
route_table_id = var.route_table_private_1a

}

variable "private_subnet_1a_id" {
type = string
}
variable "private_subnet_1b_id" {
type = string
}

variable "route_table_private_1a" {
type = string
}

variable "route_table_private_1b" {
type = string
}
