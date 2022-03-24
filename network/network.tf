module "vpc" {
  source = ".\\vpc\\"
}

module "subnet" {
  source = ".\\subnet\\"

  # VPC_ID
  vpc_id = module.vpc.aws_vpc_GhostVPC_ID_output

  depends_on = [
    module.vpc
  ]
}