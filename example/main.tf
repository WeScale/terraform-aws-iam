provider "aws" {
  region = "eu-west-1"
}
data "aws_iam_policy_document" "resource_full_access" {
  statement {
    sid       = "FullAccess"
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucketname/path/*"]

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:GetBucketLocation",
      "s3:AbortMultipartUpload"
    ]
  }
}

data "aws_iam_policy_document" "base" {
  statement {
    sid       = "BaseAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
  }
}

module "test_iam" {

  source  = "mehdi-wsc/iam-wsc/aws"
  version = "0.0.1"

  principals = {
    Service = "eks.amazonaws.com"
  }
  name_iam_role   = "role-test"
  name_iam_policy = "policy"
  defined_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]
}
output "id" {
  value = module.test_iam.iam_id
}
output "arn" {
  value = module.test_iam.iam_arn
}
output "attachements" {
  value = module.test_iam.iam_defined_attachements
}
