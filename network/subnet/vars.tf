variable "vpc_id" {}

variable "subnets" {
    type = map
    default = {

        # ALB Subnets
        ALBSubnet1 = {
            name = "ALBSubnet1"
            az = "us-east-1a"
            cidr = "10.0.1.0/24"
        }
        ALBSubnet2 = {
            name = "ALBSubnet2"
            az = "us-east-1b"
            cidr = "10.0.2.0/24"
        }
        ALBSubnet3 = {
            name = "ALBSubnet3"
            az = "us-east-1c"
            cidr = "10.0.3.0/24"
        }

        # Frontend Subnets
        FrontEndSubnet1 = {
            name = "FrontEndSubnet1"
            az = "us-east-1a"
            cidr = "10.0.4.0/24"
        }
        FrontEndSubnet2 = {
            name = "FrontEndSubnet2"
            az = "us-east-1b"
            cidr = "10.0.5.0/24"
        }
        FrontEndSubnet3 = {
            name = "FrontEndSubnet3"
            az = "us-east-1c"
            cidr = "10.0.6.0/24"
        }

        # Database subnets
        DataBaseSubnet1 = {
            name = "DataBaseSubnet1"
            az = "us-east-1a"
            cidr = "10.0.7.0/24"
        }
        DataBaseSubnet2 = {
            name = "DataBaseSubnet2"
            az = "us-east-1b"
            cidr = "10.0.8.0/24"
        }
        DataBaseSubnet3 = {
            name = "DataBaseSubnet3"
            az = "us-east-1c"
            cidr = "10.0.9.0/24"
        }         
    }
}