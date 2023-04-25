resource "aws_route_table_association" "rt-a-1" {
route_table_id = var.route_table_id
subnet_id = var.public_subnet_1a_id

}

resource "aws_route_table_association" "rt-a-2" {
route_table_id = var.route_table_id
subnet_id = var.public_subnet_1b_id

}

variable "route_table_id" {
type = string
}

variable "public_subnet_1a_id" {
type = string
}

variable "public_subnet_1b_id" {
type = string
}

