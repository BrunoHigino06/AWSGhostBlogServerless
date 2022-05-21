#VPC Inputs  
vpc = {
   Name = "CloudProject"
   cidr_block = "10.0.0.0/16"
}

#Subnet Inputs
subnets_names      = ["Alb1", "Alb2", "Alb3", "FrontEnd1", "FrontEnd2", "FrontEnd3", "DataBase1", "DataBase2", "DataBase3"]
subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
subnet_az          = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b", "us-east-1c"]