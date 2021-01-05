module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.15.0"

  bucket        = local.bucket_name

  restrict_public_buckets = true
}

# allows you to store your tfstate inside an aws s3 bucket
terraform {
  backend "s3" {
    bucket = "redhouse-tf-bucket"
    key    = "cloud3640/terraform.tfstate"
    region = "us-west-2"
  }
}
