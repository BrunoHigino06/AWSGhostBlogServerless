module "vpc" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//aws/network/vpc"

  vpc = {
    Name = "GhostVpc"
    cidr_block = "10.0.0.0/16"
  }
}

module "subnet" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//aws/network/subnet"

  # VPC ID
  vpc_id = module.vpc.vpc_id

  #SubnetConfiguration
  #ALB Subnets
  subnets_names      = ["Alb1", "Alb2", "Alb3"]
  subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_az          = ["us-east-1a", "us-east-1b", "us-east-1c"]

  depends_on = [
    module.vpc
  ]
}