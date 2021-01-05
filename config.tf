variable "my_owner_id" {
  type = string
  default = "666630334140"
}

variable "my_ami_name" {
  type = string
  default = "s3ImageApp"
}

locals {
  bucket_name = "new-vpc-bucket"
  backend_name = "redhouse-tf-bucket"
}
