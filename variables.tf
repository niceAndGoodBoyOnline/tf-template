###
# variables for provider.tf
###

variable "my_region" {
  type = string
  default = "us-west-2"
}

###
# variables for main.tf
###

variable "my_igw_name" {
  type = string
  default = "new_vpc_igw"
}

# variables for load balancer
variable "lb_instance_type" {
  type = string
  default = "t2.micro"
}

variable "lb_instance_name" {
  type = string
  default = "loadbalancer"
}

variable "number_of_instances" {
  type = number
  default = 1
}

variable "lb_ami_id" {
  type = string
  default = "ami-0528a5175983e7f28"
}

variable "lb_pem_key" {
  type = string
  default = "default_key"
}

###
# variables for vpc
###

variable "vpc_name" {
  type = string
  default = "terraform_vpc"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}


###
# variables for apps
###

variable "app0_instance_name" {
  type = string
  default = "app0"
}

variable "app1_instance_name" {
  type = string
  default = "app1"
}

variable "app2_instance_name" {
  type = string
  default = "app2"
}
