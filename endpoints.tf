resource "aws_vpc_endpoint_route_table_association" "private_subnet0_s3_endpoint" {
  route_table_id  = module.new_vpc.private_route_table_ids[0]
  vpc_endpoint_id = module.new_vpc.vpc_endpoint_s3_id
}

resource "aws_vpc_endpoint_route_table_association" "private_subnet1_s3_endpoint" {
  route_table_id  = module.new_vpc.private_route_table_ids[1]
  vpc_endpoint_id = module.new_vpc.vpc_endpoint_s3_id
}

resource "aws_vpc_endpoint_route_table_association" "private_subnet2_s3_endpoint" {
  route_table_id  = module.new_vpc.private_route_table_ids[2]
  vpc_endpoint_id = module.new_vpc.vpc_endpoint_s3_id
}
