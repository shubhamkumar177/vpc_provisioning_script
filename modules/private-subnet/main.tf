
resource "aws_subnet" "private-subnet-1a" {  
cidr_block = var.private_subnet_1a_cidr                   
availability_zone = "ap-south-1a"              
vpc_id = var.vpc_id
tags = {
Name = "private-subnet-1a"
Enviroment = "dev"
}
}

resource "aws_subnet" "private-subnet-1b" {   
cidr_block = var.private_subnet_1b_cidr                   
vpc_id = var.vpc_id
tags = {
Name = "private-subnet-1b"
Enviroment = "dev"
}
}

variable "vpc_id" {
type = string
}

output "private-subnet-1a" {
value = aws_subnet.private-subnet-1a.id           
}

output "private-subnet-1b" {
value = aws_subnet.private-subnet-1b.id           
}

variable "private_subnet_1a_cidr" {
    type = string
}

variable "private_subnet_1b_cidr" {
    type = string
}
