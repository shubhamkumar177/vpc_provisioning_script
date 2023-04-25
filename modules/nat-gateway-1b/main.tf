# This script is to create aws_nat_gateway

resource "aws_eip" "nat_eip_2" {       
  vpc = true
}


resource "aws_nat_gateway" "nat-gateway-1b" {  
subnet_id = var.subnet_id
allocation_id = aws_eip.nat_eip_2.id           
tags = {
Name = "nat-gateway-1a"
Enviroment = "dev"
}
}
variable "subnet_id" {
type = string
}

output "nat-gateway-1b-id" {
value = aws_nat_gateway.nat-gateway-1b.id           
}
