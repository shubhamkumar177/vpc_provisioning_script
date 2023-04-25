resource "aws_vpc" "vpc" {    # modify the resource name if required
cidr_block = var.vpc_cidr       # modify this value to a CIDR block range that is appropriate for your specific use case.
tags = {
Name = var.vpc_name 
Enviroment = "dev"     
}
}

output "vpc" {
value = aws_vpc.vpc.id        # modify the resource name same as above.
}
variable "vpc_cidr"{
    type = string
}

variable "vpc_name" {
    type = string
}