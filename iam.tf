data "aws_iam_policy_document" "backend_s3_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "backend_s3_role"{
  name = "backend_s3_role"
  assume_role_policy = data.aws_iam_policy_document.backend_s3_role_policy.json
}

data "aws_iam_policy_document" "backend_s3_policy_doc" {
  statement {
    sid = "accessBackendS3"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}",
      "arn:aws:s3:::${local.bucket_name}/*",
    ]
  }
}

resource "aws_iam_role_policy" "backend_s3_iam_policy"{
  name = "backend_s3_bucket_iam_policy"
  role = aws_iam_role.backend_s3_role.id
  policy = data.aws_iam_policy_document.backend_s3_policy_doc.json
}

resource "aws_iam_instance_profile" "backend_s3_profile" {
  name = "backend_s3_profile"
  role = aws_iam_role.backend_s3_role.name
}
