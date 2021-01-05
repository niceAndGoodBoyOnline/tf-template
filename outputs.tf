output "lb_address" {
  value = [module.ec2_lb.public_ip]
}

output "app0_ip" {
  value = [module.ec2_app0.private_ip]
}

output "app1_ip" {
  value = [module.ec2_app1.private_ip]
}

output "app2_ip" {
  value = [module.ec2_app2.private_ip]
}
