# data sources for user_data
data "template_file" "lb_user_data" {
  template = file("init/lb_init.sh")
}

data "template_file" "app0_user_data" {
  template = file("init/app0_init.sh")
}

data "template_file" "app1_user_data" {
  template = file("init/app1_init.sh")
}

data "template_file" "app2_user_data" {
  template = file("init/app2_init.sh")
}

# data for owned/private ami
data "aws_ami" "s3ImageApp" {
 most_recent = true

 filter {
   name   = "name"
   values = [var.my_ami_name] #change in config.tf
 }

 owners = [var.my_owner_id] #chaange in config.tf
}
