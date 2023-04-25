Provisioning a VPC using Terraform

This is the Terraform script for vpc Provisioning. You're going to create VPC with the same configuration as shown in vpc.png file.


This repository contains Terraform code to provision a VPC on AWS. The following instructions will guide you through the process of customizing the code to create your own VPC.

Prerequisites
Before you begin, you will need the following:

An AWS account
Terraform installed on your local machine
AWS cli on your local machine
aws configure (Provide accesskey and secret access key) 

Customizing the Code
To customize the code, follow these steps:

Clone the repository to your local machine.

Navigate to the root directory of the repository.

Open the variables.tf file in a text editor.

Modify the values of the variables as per your requirements. The variables and their default values are listed below:

vpc_cidr: The CIDR block for the VPC. Default: 10.0.0.0/16.
vpc_name: The name of the VPC. Default: test_vpc.
public_subnet_1a_cidr: The CIDR block for the first public subnet. Default: 10.0.0.0/24.
public_subnet_1b_cidr: The CIDR block for the second public subnet. Default: 10.0.1.0/24.
private_subnet_1a_cidr: The CIDR block for the first private subnet. Default: 10.0.2.0/24.
private_subnet_1b_cidr: The CIDR block for the second private subnet. Default: 10.0.3.0/24.
Note: The CIDR blocks for the subnets should be within the CIDR block of the VPC.

Save the changes to the variables.tf file.

Provisioning the VPC
To provision the VPC, follow these steps:

Ensure that you are in the root directory of the repository.

Run the following commands:
terraform init
terraform plan
terraform apply

You're Done. Congrats