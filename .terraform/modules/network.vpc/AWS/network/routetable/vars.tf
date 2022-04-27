variable "vpc_id" {}

variable "rt_names" {
    type = list(string)
    description = "Name of the Route Tables"
}