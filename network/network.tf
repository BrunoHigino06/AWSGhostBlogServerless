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
}