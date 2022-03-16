module "network" {
  source = ".\\network\\"
  providers = {
    aws = aws.us
  }
}