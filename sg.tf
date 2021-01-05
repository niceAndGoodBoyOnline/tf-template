# define security groups here
module "lb_secgroup" {
  source = "terraform-aws-modules/security-group/aws"
  version = "3.16.0"
  depends_on  = [module.new_vpc]

  name        = "lb_secgroup"
  description = "Security group for public facing nginx load balancer"
  vpc_id      = module.new_vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp","https-443-tcp","http-80-tcp"]
  egress_rules            = ["all-all"]
}

module "app_secgroup" {
  source = "terraform-aws-modules/security-group/aws"
  version = "3.16.0"
  depends_on  = [module.new_vpc]

  name        = "app_secgroup"
  description = "Security group for private apps"
  vpc_id      = module.new_vpc.vpc_id

  ingress_cidr_blocks      = ["10.0.101.0/24"]
  ingress_rules            = ["sam-4040-tcp"]
  egress_rules             = ["all-all"]
}
