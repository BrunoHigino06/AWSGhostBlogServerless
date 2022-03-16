module "vpc" {
  source = ".\\vpc\\"
  providers = {
    aws = aws.us
  }
}

module "subnet" {
  source = ".\\subnet\\"
  providers = {
    aws = aws.us
  }
  
  # VPC_ID
  vpc_id = module.vpc.aws_vpc_GhostVPC_ID_output

  depends_on = [
    module.vpc
  ]
}