Below is the Template to use Transit gateway. Add as many vpc you want then attach that vpc to the transit gateway.

resource "aws_vpc" "vpc_1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_vpc" "vpc_2" {
  cidr_block = "20.0.0.0/16"
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.vpc_2.id
  cidr_block = "20.0.1.0/24"
}

resource "aws_ec2_transit_gateway" "tgw" {
  description = "My Transit Gateway"
  tags = {
    Name = "My Transit Gateway"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attachment_1" {
  subnet_ids         = [aws_subnet.subnet_1.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_1.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attachment_2" {
  subnet_ids         = [aws_subnet.subnet_2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_2.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attachment_2" {
  subnet_ids         = var.public_subnet_1a_id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = var.vpc_id
}

variable "vpc_id" {
    type = string
}

variable "public_subnet_1a_id" {
    type = string
}
