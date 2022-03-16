# VPC vars

variable "aws_vpc_GhostVPC" {
    type = object({
        cidr_block = string
  })

    default = {
        cidr_block = "10.0.0.0/16"
    }
}

# Load balance network vars #

# Subnet vars

variable "aws_subnet_ELBSubnet" {
    type = object({
        cidr_block = string
        Name = string
        availability_zone = string
    })

    default = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        Name = "ELBSubnet"
    }
}

# Route Table

variable "aws_route_table_ELBRT" {
    type = object({
        Name = string
    })

    default = {
        Name = "DBRT"
    }
}

# Route for internet

variable "aws_route_ToInternet" {
    type = object({
        destination_cidr_block = string
    })

    default = {
        destination_cidr_block = "0.0.0.0/0"
    }
}

