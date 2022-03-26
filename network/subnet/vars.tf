variable "vpc_id" {}

variable subnets {
    description = "subnets"
    type     = map
    default  = {

    # load balance subnets
        ALBSubnet1 = {
            name        = "ALBSubnet1"
            cidr_block  = "10.0.1.0/24"
            az          = "us-east-1a"
        }
        ALBSubnet2      = {
            name        = "ALBSubnet2"
            cidr_block  = "10.0.2.0/24"
            az          = "us-east-1b"
        }
        ALBSubnet3      = {
            name        = "ALBSubnet3"
            cidr_block  = "10.0.3.0/24"
            az          = "us-east-1c"
        }
  }
}