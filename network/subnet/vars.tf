# SubNets vars #

# ALB

variable "aws_subnet_ALBSubnet" {
    type = object({
        cidr_block1 = string
        Name1 = string
        availability_zone1 = string
        cidr_block2 = string
        Name2 = string
        availability_zone2 = string
    })

    default = {

        # ALB 1

        cidr_block1 = "10.0.1.0/24"
        availability_zone1 = "us-east-1a"
        Name1 = "ALBSubnet1"

        # ALB 2

        cidr_block2 = "10.0.2.0/24"
        availability_zone2 = "us-east-1b"
        Name2 = "ALBSubnet2"        
    }
}

# FrontEnd

variable "aws_subnet_FrontEndSubnet" {
    type = object({
        cidr_block1 = string
        Name1 = string
        availability_zone1 = string
        cidr_block2 = string
        Name2 = string
        availability_zone2 = string
    })

    default = {

        # FrontEndSubnet 1

        cidr_block1 = "10.0.3.0/24"
        availability_zone1 = "us-east-1a"
        Name1 = "FrontEndSubnet1"

        # FrontEndSubnet 2

        cidr_block2 = "10.0.4.0/24"
        availability_zone2 = "us-east-1b"
        Name2 = "FrontEndSubnet2"        
    }
}

# DataBase

variable "aws_subnet_DataBaseSubnet" {
    type = object({
        cidr_block1 = string
        Name1 = string
        availability_zone1 = string
        cidr_block2 = string
        Name2 = string
        availability_zone2 = string
    })

    default = {

        # DataBaseSubnet 1

        cidr_block1 = "10.0.5.0/24"
        availability_zone1 = "us-east-1a"
        Name1 = "DataBaseSubnet1"

        # DataBaseSubnet 2

        cidr_block2 = "10.0.6.0/24"
        availability_zone2 = "us-east-1b"
        Name2 = "DataBaseSubnet2"        
    }
}