module "vpc" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//network/vpc"

  vpc = {
    Name = "GhostVpc"
    cidr_block = "10.0.0.0/16"
  }
}

module "subnet" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//network/subnet"

  # VPC ID
  vpc_id = module.vpc.id

  subnet = {
    name_public = "ALBSubnet"
    cidr_block_public = ["10.0.1.0/24", "10.0.2.0/24"]
  }

  depends_on = [
    module.vpc
  ]
}