variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    default = "test_vpc"
}

variable "public_subnet_1a_cidr" {
    default = "10.0.0.0/24"
}

variable "public_subnet_1b_cidr" {
    default = "10.0.1.0/24"
}

variable "private_subnet_1a_cidr" {
    default = "10.0.2.0/24"
}

variable "private_subnet_1b_cidr" {
    default = "10.0.3.0/24"
}