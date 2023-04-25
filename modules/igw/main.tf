# This script is to create aws_internet_gateway.

resource "aws_internet_gateway" "my-igw" {                           
vpc_id = var.vpc_id
tags = {
Name = "my-igw"
Enviroment = "dev"
}
}

variable "vpc_id" {
type = string
}

output "igw_id" {
value = aws_internet_gateway.my-igw.id   
}     
