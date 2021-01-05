#root tf file

module "new_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr
  map_public_ip_on_launch = true

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24"]
  enable_s3_endpoint = true

  igw_tags = {
    "Name" = var.my_igw_name
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ec2_lb" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.15.0"
  depends_on = [module.lb_secgroup, module.new_vpc]

  name                   = var.lb_instance_name
  instance_count         = var.number_of_instances

  ami                    = var.lb_ami_id
  instance_type          = var.lb_instance_type
  key_name               = var.lb_pem_key
  monitoring             = true

  vpc_security_group_ids = [module.lb_secgroup.this_security_group_id]
  subnet_id              = module.new_vpc.public_subnets[0]

  iam_instance_profile   = aws_iam_instance_profile.backend_s3_profile.name
  user_data = data.template_file.lb_user_data.rendered

  private_ip = "10.0.101.51"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_app0" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.15.0"
  depends_on = [module.app_secgroup, module.new_vpc]
  name                   = var.app0_instance_name
  instance_count         = var.number_of_instances

  ami                    = data.aws_ami.s3ImageApp.id
  instance_type          = var.lb_instance_type
  key_name               = var.lb_pem_key
  monitoring             = true
  vpc_security_group_ids = [module.app_secgroup.this_security_group_id]
  subnet_id              = module.new_vpc.private_subnets[0]
  iam_instance_profile   = aws_iam_instance_profile.backend_s3_profile.name
  user_data = data.template_file.app0_user_data.rendered

  private_ip = "10.0.1.23"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_app1" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.15.0"
  depends_on = [module.app_secgroup, module.new_vpc]
  name                   = var.app1_instance_name
  instance_count         = var.number_of_instances

  ami                    = data.aws_ami.s3ImageApp.id
  instance_type          = var.lb_instance_type
  key_name               = var.lb_pem_key
  monitoring             = true
  vpc_security_group_ids = [module.app_secgroup.this_security_group_id]
  subnet_id              = module.new_vpc.private_subnets[1]
  iam_instance_profile   = aws_iam_instance_profile.backend_s3_profile.name
  user_data = data.template_file.app1_user_data.rendered

  private_ip = "10.0.2.23"


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_app2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.15.0"
  depends_on = [module.app_secgroup, module.new_vpc]
  name                   = var.app2_instance_name
  instance_count         = var.number_of_instances

  ami                    = data.aws_ami.s3ImageApp.id
  instance_type          = var.lb_instance_type
  key_name               = var.lb_pem_key
  monitoring             = true
  vpc_security_group_ids = [module.app_secgroup.this_security_group_id]
  subnet_id              = module.new_vpc.private_subnets[2]
  iam_instance_profile   = aws_iam_instance_profile.backend_s3_profile.name
  user_data = data.template_file.app2_user_data.rendered

  private_ip = "10.0.3.23"


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
